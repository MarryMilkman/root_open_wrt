#!/bin/sh

ping -c $1 -W 1  $2 | grep packets | awk '{print $4 ""}'
