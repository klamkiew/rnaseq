/************************************************************************
*
************************************************************************/
process hisat2 {
  conda 'envs/hisat2.yaml'
  publishDir "${params.output}/${params.dir}", mode: 'copy', pattern: "${sample_name}.sorted.bam"

  input:
  tuple val(sample_name), file(reads)
  tuple file(reference), file(index)

  output:
  tuple val(sample_name), file("${sample_name}.sorted.bam")

  script:
  // if (params.mode == 'single') {
  """
  hisat2 -x ${reference.baseName} -U ${reads[0]} -p ${params.cores} | samtools view -bS | samtools sort -o ${sample_name}.sorted.bam -T tmp --threads ${params.cores}
  """
  // }
  // else {
  // """
  // hisat2 -x ${reference.baseName} -1 ${reads[0]} -2 ${reads[1]} -p ${params.cores} | samtools view -bS | samtools sort -o ${sample_name}.sorted.bam -T tmp --threads ${params.cores}
  // """
  // } 
}


