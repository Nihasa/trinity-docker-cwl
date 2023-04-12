cwlVersion: v1.2
class: CommandLineTool
doc: De novo transcriptome assembly with Trinity
requirements:
  DockerRequirement:
    dockerPull: docker.io/my_trinity:latest
inputs:
  reads:
    type: File[]
    inputBinding:
      prefix: --left
      itemSeparator: " "
      separate: false
  output_prefix:
    type: string
    inputBinding:
      prefix: --output
outputs:
  assembled_transcripts:
    type: File
    outputBinding:
      glob: "$(inputs.output_prefix)*.fasta"
baseCommand: ["Trinity"]
stdout: trinity.log
arguments:
  - "--seqType"
  - "fq"
  - "$(inputs.reads)"
  - "--output"
  - "$(inputs.output_prefix)"