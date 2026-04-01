[![Build and Push Docker Image](https://github.com/KarlssonLaboratory/bioinfo-java/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/KarlssonLaboratory/bioinfo-java/actions/workflows/docker-publish.yml)

A java container with tabix, unzip and wget. Mainly used to run [snpEff](https://pcingola.github.io/SnpEff/) software inside a nextflow pipeline.

> [!NOTE]
> Every push to `main` automatically builds and pushes the image to GitHub Container Registry. Tagged releases (e.g. `v1.0.0`) produce versioned image tags.

## Included softwares

`tabix`, `unzip`, `wget`.

## Include in nextflow process

```groovy
process SNPEFF_ANNOTATE {
	
	. . .

	container "${workflow.containerEngine == 'singularity' ?
  	'docker://ghcr.io/karlssonlaboratory/bioinfo-java:main' :
  	'ghcr.io/karlssonlaboratory/bioinfo-java:main'}"

  . . .
}
```

The container definition uses an [elvis operator](https://www.nextflow.io/docs/latest/reference/syntax.html#unary-expressions) = `<statement> ? <TRUE> : <FALSE>`

## Pull from GitHub Container Registry

```bash
docker pull ghcr.io/KarlssonLaboratory/bioinfo-java:main
```

## Run interactively

```bash
docker run -it --rm -v $(pwd):/data ghcr.io/KarlssonLaboratory/bioinfo-java:main
```

## Build locally

```bash
git clone https://github.com/KarlssonLaboratory/bioinfo-java.git
cd bioinfo-java
docker build -t bioinfo-java .
```