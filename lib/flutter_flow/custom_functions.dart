import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int calculateTotalEnergyExpenditure(
  int? age,
  int? height,
  int? weight,
  String? gender,
  String? activityLevel,
) {
  // calculate the total daily energy expenditure
  if (age == null ||
      height == null ||
      weight == null ||
      gender == null ||
      activityLevel == null) {
    return 0;
  }

  double bmr;
  if (gender == 'male') {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  double activityMultiplier;
  switch (activityLevel) {
    case 'sedentary':
      activityMultiplier = 1.2;
      break;
    case 'lightlyActive':
      activityMultiplier = 1.375;
      break;
    case 'moderatelyActive':
      activityMultiplier = 1.55;
      break;
    case 'veryActive':
      activityMultiplier = 1.725;
      break;
    case 'extraActive':
      activityMultiplier = 1.9;
      break;
    default:
      activityMultiplier = 1.2;
  }

  return (bmr * activityMultiplier).round();
}

int? calculateBMI(
  int? weight,
  int? height,
  int? age,
  int? sugarLevel,
) {
  // calculate the BMI of the person using the inputs height, weight, age and sugar level
  if (weight == null || height == null || age == null || sugarLevel == null) {
    return null;
  }
  final double heightInMeters = height / 100.0;
  final double bmi = weight / math.pow(heightInMeters, 2);
  return bmi.toInt();
}

String? displayHealthState(
  int? height,
  int? weight,
  int? age,
  int? sugarLevel,
) {
  // return a string saying they're obese, underweight, or normal according to the bmi
  if (height == null || weight == null || age == null || sugarLevel == null) {
    return null;
  }

  final double heightInMeters = height / 100;
  final double bmi = weight / math.pow(heightInMeters, 2);

  if (bmi < 18.5) {
    return 'You are Underweight. For a healthy weight gain consider consuming 200 to 300 calories more than your total energy expenditure';
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return 'You are Healthy weight. Consume the amount of calories from your total energy expenditure.';
  } else if (bmi >= 25 && bmi <= 29.9) {
    return 'You are Overweight. For a healthy and steady weight loss try consuming 200 to 300 calories lesser than the energy expenditure level.';
  } else {
    return 'You are Obease. Add regular cardio and progressive calorie deficit into your workout regime and diet.';
  }
}
