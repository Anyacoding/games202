# Install script for directory: /home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/anya/games202/homework2/prt/build/ext_build/openexr/OpenEXR/IlmImf/libIlmImf.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/OpenEXR" TYPE FILE FILES
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfForward.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfExport.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfBoxAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCRgbaFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelList.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChannelListAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompressionAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDoubleAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFrameBuffer.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfHeader.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfIO.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfIntAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrderAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMatrixAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOpaqueAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfVecAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfHuf.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfWav.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLut.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfArray.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompression.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfLineOrder.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfName.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPixelType.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfVersion.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfXdr.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfConvert.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImage.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPreviewImageAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticities.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfChromaticitiesAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCode.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfKeyCodeAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCode.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTimeCodeAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRational.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRationalAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFramesPerSecond.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStandardAttributes.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmap.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfEnvmapAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInt64.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgba.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescription.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTileDescriptionAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledRgbaFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfRgbaYca.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTestFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfThreading.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfB44Compressor.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfStringVectorAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiView.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfAcesFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMultiPartInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfGenericInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartType.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfPartHelper.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfOutputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledOutputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfInputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfTiledInputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineOutputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepScanLineInputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledInputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputFile.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepTiledOutputPart.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepFrameBuffer.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepCompositing.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfCompositeDeepScanLine.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfNamespace.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfMisc.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageState.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfDeepImageStateAttribute.h"
    "/home/anya/games202/homework2/prt/ext/openexr/OpenEXR/IlmImf/ImfFloatVectorAttribute.h"
    )
endif()

