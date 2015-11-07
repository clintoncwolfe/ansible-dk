#!/bin/env python
#
# TODO: this code is very *nix centric.  Ensure that this works with Windows systems

import click
import os
import sys


###################################################
# Defaults
RUBY_ABI = "2.1.0"
PYTHON_ABI = "2.7"
HOME = os.getenv("HOME")


###################################################
# Generic top-level group definitions
@click.group()
def cli():
    pass


@cli.group()
def generate():
    pass


@cli.command()
@click.option('--debug', is_flag=True, help="Enable debug mode")
def shell_init(debug=False):
    if debug:
        print("[DEBUG] Home directory = %s" % HOME)

    directories = [
        HOME+"/.ansible-dk",
        HOME+"/.ansible-dk/gem",
        HOME+"/.ansible-dk/python"
    ]

    for directory in directories:
        try:
            if debug:
                print("[DEBUG] Creating directory: %s" % directory)
            os.mkdir(directory)
        except FileNotFoundError as e:
            print("Error: Unable to create directory: %s" % e.filename)
            sys.exit(-1)
        except FileExistsError as e:
            if debug:
                print("[DEBUG] directory already exists - skipping - %s" % e.filename)
            pass

    # Print out environment variables for the shell
    print("export PATH=\"/opt/ansible-dk/bin:"+HOME+"/.ansible-dk/gem/ruby/"+RUBY_ABI+ \
          "/bin:/opt/ansible-dk/embedded/bin:$PATH")
    print("export GEM_ROOT=\"/opt/ansible-dk/embedded/lib/ruby/gems/"+RUBY_ABI+"\"")
    print("export GEM_HOME=\""+HOME+"/.ansible-dk/gem/ruby/"+RUBY_ABI+"\"")
    print("export GEM_PATH=\""+HOME+"/.ansible-dk/gem/ruby/"+RUBY_ABI+ \
          ":/opt/ansible-dk/embedded/lib/ruby/gems/"+RUBY_ABI+"\"")
    print("export PYTHONUSERBASE=\""+HOME+"/.ansible-dk/python\"")
    print("export PIP_INSTALL_OPTION=\"--user\"")

# -- generate command
@generate.command(name='play')
@click.option('--name', required=True, help='Name of play to generate')
def generate_play(name):
    print("Generating play: ", name)


@generate.command(name='role')
@click.option('--name', required=True, help='Name of role to generate')
def generate_role(name):
    print("Generating role: ", name)


###################################################
# Call main CLI
if __name__ == '__main__':
    cli()
