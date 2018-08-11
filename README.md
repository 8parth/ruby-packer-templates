# Packer Ruby Template

- Creates AMI with Git, Nginx, Rbenv and Ruby.
- The Ruby version can be specified in `variables.json`.

## Usage:

```bash
packer build -var-file=variables.json template.json | tee output/packer_output.txt
```

#### Additionally, to get packer ami id in tfvar file:

```bash
run build_ami.sh
```