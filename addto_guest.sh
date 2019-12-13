#!/bin/sh

ipset -N defguest nethash

ipset -A defguest $1

