import 'package:flutter/material.dart';

double getWidth(context, {width = 0.04}) =>
    MediaQuery.sizeOf(context).width * width;
double getHeight(context, {height = 0.04}) =>
    MediaQuery.sizeOf(context).height * height;
SizedBox spaceBetween(context, {height = 0.04}) => SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
    );
SizedBox spaceAround(context, {width = 0.04}) => SizedBox(
      width: MediaQuery.sizeOf(context).width * width,
    );
Divider divider(context) => Divider(
      height: MediaQuery.sizeOf(context).height * 0.0004,
      thickness: MediaQuery.sizeOf(context).height * 0.0004,
      color: Colors.grey,
    );
double textSize(context, {size = 0.05}) =>
    MediaQuery.sizeOf(context).width * size;

double margin(context, {margin = 0.05}) =>
    MediaQuery.sizeOf(context).height * margin;

BorderRadius borderRadius(context, {borderRadius = 0.05}) =>
    BorderRadius.circular(MediaQuery.sizeOf(context).width * borderRadius);
