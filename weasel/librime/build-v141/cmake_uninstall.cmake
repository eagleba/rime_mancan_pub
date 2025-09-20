if (NOT EXISTS "F:/3.Projects/mancan_v1/weasel/librime/build-v141/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"F:/3.Projects/mancan_v1/weasel/librime/build-v141/install_manifest.txt\"")
endif(NOT EXISTS "F:/3.Projects/mancan_v1/weasel/librime/build-v141/install_manifest.txt")

file(READ "F:/3.Projects/mancan_v1/weasel/librime/build-v141/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach (file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    if (EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
        execute_process(
            COMMAND D:/Program/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/bin/cmake.exe -E remove "$ENV{DESTDIR}${file}"
            OUTPUT_VARIABLE rm_out
            RESULT_VARIABLE rm_retval
        )
        if(NOT ${rm_retval} EQUAL 0)
            message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
        endif (NOT ${rm_retval} EQUAL 0)
    else (EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
        message(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
    endif (EXISTS "$ENV{DESTDIR}${file}" OR IS_SYMLINK "$ENV{DESTDIR}${file}")
endforeach(file)
