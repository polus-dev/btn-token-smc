#!/bin/bash
# builder for BTN FunC code

func_targets=( "func/minter-ico-v2.func" )
func_libs_path="func/lib"; func_utils_path="func/utils"
out_dir="auto"

function log_info {
    # shellcheck disable=SC2059
    printf "[info] $1\n"
}

function listdir() {
    files=()
    for entry in "$1"/*; do
        files+=("$entry");
    done
    echo "${files[@]}"
}

function join_by() {
    local IFS="$1"; shift; echo "$*"
}

for target in "${func_targets[@]}";  do
    output_fif_path="${out_dir}/$(basename $target).code.fif"
    log_info "target: ${target}"; log_info "output: ${output_fif_path}"

    libs=$(join_by " " "$(listdir $func_libs_path)")
    utils=$(join_by " " "$(listdir $func_utils_path)")
    log_info "libs:   ${libs}"; log_info "utils:  ${utils}\n"

    build_cmd="func -SPA -o ${output_fif_path} ${libs} ${utils} ${target}"
    eval "$build_cmd"

    log_info "build successful"
    log_info "------------------------"
done