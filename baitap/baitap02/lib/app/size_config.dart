import 'package:flutter/material.dart';

SizedBox spaceBetween(context, {height = 0.04}) => SizedBox(
      height: MediaQuery.sizeOf(context).height * height,
    );
