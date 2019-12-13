#!/bin/sh

ipset -N deflan nethash

ipset -A deflan $1

