#!/usr/bin/env python3

import setupLibPaths
import test_kv260

import os
import sys
import argparse
import importlib
import rogue

import pyrogue as pr
import pyrogue.pydm

if __name__ == "__main__":

#################################################################

    # Set the argument parser
    parser = argparse.ArgumentParser()

    # Convert str to bool
    argBool = lambda s: s.lower() in ['true', 't', 'yes', '1']

    # Add arguments
    parser.add_argument(
        "--ip",
        type     = str,
        required = True,
        help     = "ETH Host Name (or IP address)",
    )

    # Get the arguments
    args = parser.parse_args()

    #################################################################

    with test_kv260.Root(
        ip       = args.ip,
        zmqSrvEn = True,
    ) as root:
        pyrogue.pydm.runPyDM(
            serverList = root.zmqServer.address,
            sizeX      = 800,
            sizeY      = 800,
        )

    #################################################################
