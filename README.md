# Oxygen Framework for Akoma Ntoso

An Oxygen authoring framework for working with Akoma Ntoso 3.0 files.

# Features
 
 - Support of Akoma Ntoso 3.0.
 - Author mode style-sheet.
 - New document templates for most AKN types (Act, Amendment, Bill, Debate, etc...).
 - A basic PDF transformation using Oxygen Chemistry
 - 2.0 to 3.0 conversion XSL transformation.
 - Lots of sample files (originally from http://sinatra.cirsfid.unibo.it/XMLViewer/) provided in AKN 3.0 format.

# Limitations
 - Intra-document links do not yet work in editor, or in PDF output.
 - No handling of external link to docs via AKN style URIs.
 - documentRef and componentRef are not processed during editing or publish.
 - Documents given as collectionBody + components will have issues in PDF render.

Check the issues listed for this githib repository to check on other recorded issues. 
   
# Installation
 - Download a ZIP archive from GitHub.
 - Choose a folder on your computer and unzip.
 - In Oxygen, open Preferences > Document Type Assosciation > Locations.
 - Add the unzipped folder to the list of 'additional framework direcctories'.
 - On the Preferences > Document Type Assosciation screen, confirm that there is an entry listed for Akoma Ntoso.
 
# Usage in Oxygen
 - After installing the framework, open an existing Akoma Ntoso 3.0 document or create new Akoma Ntoso document.

# Copyright and License
This project is available under an MIT license. Check license.txt for more details.