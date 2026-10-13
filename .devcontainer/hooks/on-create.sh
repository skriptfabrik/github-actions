#!/bin/sh

set -e

# Change ownership of the local data volume mount to the current user
sudo chown $(id -u):$(id -g) ~/.local
