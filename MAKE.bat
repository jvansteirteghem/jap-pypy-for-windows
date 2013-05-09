set SEVENZIP_HOME="C:\Program Files\7-Zip"
set P4W_VERSION=1.0.0-SNAPSHOT
if exist MAKE rmdir MAKE /s /q
mkdir MAKE
cd MAKE
%SEVENZIP_HOME%\7z.exe x ..\openssl-0.9.8k_WIN32.zip -oopenssl-0.9.8k_WIN32
set OPENSSL_HOME=%CD%\openssl-0.9.8k_WIN32
set PATH=%OPENSSL_HOME%;%OPENSSL_HOME%\bin;%PATH%
%SEVENZIP_HOME%\7z.exe x ..\pypy-1.9-win32.zip -oP4W-%P4W_VERSION%
set PYPY_HOME=%CD%\P4W-%P4W_VERSION%\pypy-1.9
set PATH=%PYPY_HOME%;%PYPY_HOME%\bin;%PATH%
pypy ..\distribute_setup.py
pypy ..\get-pip.py
pip install ..\PYPI\pyOpenSSL-0.13.tar.gz
pip install ..\PYPI\pycrypto-2.6-PYPY.zip
pip install ..\PYPI\zope.interface-4.0.5.zip
pip install ..\PYPI\pyasn1-0.1.7.tar.gz
pip install ..\PYPI\Twisted-13.0.0.tar.bz2
pip install ..\PYPI\autobahn-0.5.14.zip
cd P4W-%P4W_VERSION%
copy ..\..\README.txt README.txt
cd ..
%SEVENZIP_HOME%\7z.exe a -tzip P4W-%P4W_VERSION%.zip P4W-%P4W_VERSION%
cd ..