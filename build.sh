#!/usr/bin/env bash

mkdocs build
cp -rf site/* .
rm -rf site
