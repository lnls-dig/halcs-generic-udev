# !! WARNING !! DEPRECATED REPOSITORY. THIS IS NOW SHIPPED WITH HALCS https://github.com/lnls-dig/halcs

# HALCS UDEV replacement scripts for generic SDB identification

The purpose of this project is to replace the specific
udev rules and scripts from HALCS (https://github.com/lnls-dig/halcs)
to a generic ones, that are modifiable to allow the same PCIe VendorID/DeviceID
gateware to use different Entrypoints depending on some SDB properties.

A typical usage of this is to be able to differentiate between two or more
gateware applications using the same VendorID/DeviceID from PCIe. With the
ability to extract SDB information from the gateware, such as the gateware
name, internal FMC names and versions, commit IDs, these scripts can select
a different entrypoint to control the board.

This could also be accomplished by means of different VendorID/DeviceID
for each new application, but that would incur changing the driver to
support new DeviceIDs.
