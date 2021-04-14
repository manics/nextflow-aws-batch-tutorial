#!/usr/bin/env nextflow

params.str = 'Hello world!'

process splitLetters {

    container 'ubuntu:20.04'

    output:
    file 'chunk_*' into letters

    """
    printf '${params.str}' | split -b 6 - chunk_
    """
}


process convertToUpperX {

    container 'ubuntu:20.04'

    input:
    file x from letters.flatten()

    output:
    stdout result

    """
    cat $x | tr '[a-z]' '[A-Z]'
    echo
    cat /etc/issue.net
    """
}

result.view { it.trim() }