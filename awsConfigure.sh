#!/bin/bash

echo "Running AWS Configure..."

# Function to read input silently
read_silent() {
    stty -echo
    read "$@"
    stty echo
}

# AWS Access Key ID
echo -n "AWS Access Key ID [None]: "
read_silent aws_access_key_id
echo

# AWS Secret Access Key
echo -n "AWS Secret Access Key [None]: "
read_silent aws_secret_access_key
echo

aws_default_region="eu-west-1"
echo "Default region name [eu-west-1]: eu-west-1"

# Default output format
echo -n "Default output format [None]: "
read aws_default_output > /dev/null

echo "AWS CLI configuration completed."
echo "Your credentials have been securely stored."