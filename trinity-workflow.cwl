cwlVersion: v1.2
class: CommandLineTool
doc: Run Trinity using the TrinityRNASEQ Docker image
requirements:
  DockerRequirement:
    dockerPull: trinityrnaseq/trinityrnaseq
inputs:
  seqType:
    type: string
    inputBinding:
      prefix: "--seqType"
    doc: |
      The type of input reads. Accepted values are 'fq' for FASTQ, 
      'fa' for FASTA, or 'fq.gz' for gzipped FASTQ.
  left:
    type: File
    inputBinding:
      prefix: "--left"
    doc: |
      Path to the left input reads in FASTQ format.
  right:
    type: File
    inputBinding:
      prefix: "--right"
    doc: |
      Path to the right input reads in FASTQ format.
  max_memory:
    type: string
    inputBinding:
      prefix: "--max_memory"
    doc: |
      Maximum amount of memory to be used by Trinity during assembly. 
      Must be a string ending in 'G' or 'M' (e.g. '1G' or '500M').
  CPU:
    type: int
    inputBinding:
      prefix: "--CPU"
    doc: |
      Number of CPU cores to be used by Trinity during assembly.
  output_name:
    type: string
    default: "trinity_out_dir"
    inputBinding:
      prefix: "--output"
    doc: |
      Name of the output directory to be created. Defaults to 
      'trinity_out_dir' if not specified.
outputs:
  trinity_out_dir:
    type: Directory
    outputBinding:
      glob: $(inputs.output_name)
baseCommand: Trinity
