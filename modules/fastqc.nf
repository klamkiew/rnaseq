/************************************************************************
* FastQC
************************************************************************/
process fastqc {
    label 'fastqc'
    label 'smallTask'

    input:
    tuple val(name), path(reads) 

    output:
    path("*_fastqc.zip", emit: zip)

    script:
    """
    fastqc --noextract -t ${task.cpus} ${reads}
    """
}
