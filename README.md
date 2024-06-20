# Terraform OKE Action

Esse repositório contém três Action do GitHub responsáveis pelo `plan`, `apply` e `destroy` de um cluster OKE na Oracle Cloud utilizando Terraform. O projeto de exemplo do Terraform foi criado no repositório [OKE-FREE](https://github.com/Rapha-Borges/oke-free)

# Pré-requisitos

- Fork desse repositório e permissão para executar Actions. Na aba `Settings` -> `Actions` -> `General` -> `Allow all actions and reusable workflows`.

- Informações de login e API Key da Oracle Cloud, um par de chaves SSH e um bucket no OCI.

## Obtendo as informações de login e API Key da Oracle Cloud

1. Acesse o console da Oracle Cloud e vá para a página [API Keys](https://cloud.oracle.com/identity/domains/my-profile/api-keys) nos detalhes do usuário.

2. Clique em "Add API Key" e faça o download da `Private Key`.

3. Clique em `Add` e copie as informações de `Tenancy OCID`, `User OCID` e `Fingerprint`.

## Criando um par de chaves SSH

1. Execute o comando `ssh-keygen -t rsa -b 4096 -f {path/to/save/key}` para criar um par de chaves SSH.

## Criando um bucket no OCI

1. Em [Compartments](https://cloud.oracle.com/identity/compartments), clique em `Create Compartment` e crie um compartimento, diferente do que vamos utilizar para o cluster OKE.

2. em [Object Storage & Archive Storage](https://cloud.oracle.com/object-storage/buckets), selecione o compartimento criado e clique em `Create Bucket` e então `Create` para criar um bucket com as configurações padrão.

3. Em [Pre-authenticated Requests](https://cloud.oracle.com/object-storage/pre-authenticated-requests), clique em `Create Pre-authenticated Request`.

4. Selecione `Object` como `Pre-authenticated Request Target` e passe o nome `terraform.tfstate`.

5. Marque a opção `Permit object read and writes` e clique em `Create`.

6. Copie o link gerado no campo `Pre-Authenticated Request URL` e salve, ele será utilizado como variável de ambiente.

# Configuração

Agora que você tem todas as informações necessárias, será necessário configurar o repositório para utilizar as variáveis de ambiente.

1. Em `Settings` do repositório, clique em `Secrets and Variables`, após isso clique em `Actions`.

2. Clique em `New repository secret` e adicione as seguintes variáveis de ambiente:

- `OCI_REGION`: Região da Oracle Cloud onde o cluster será criado.

- `OCI_TENANCY_OCID`: OCID do tenancy.

- `OCI_USER_OCID`: OCID do usuário.

- `OCI_FINGERPRINT`: Fingerprint da chave API.

- `OCI_KEY_FILE`: Conteúdo da chave privada.

- `SSH_PUBLIC_KEY`: Conteúdo da chave pública.

- `TF_BUCKET`: Link do bucket no OCI.

# Utilizando o Terraform Plan

Toda vez que for feito um push no repositório, nas branches `main` e `feature`, a Action de `plan` será executada automaticamentem, sendo possível visualizar o plano de execução no console.

O `Plan` pode ser executado manualmente na aba `Actions` do repositório a qualquer momento. Isso é útil para validar as mudanças antes de aplicá-las, sem a necessidade de fazer um push.

* Atenção: Sempre aguarde o fim do `Plan` e valide o plano de execução antes de aplicar as mudanças.

# Utilizando o Terraform Apply

A Action de `apply` é manual e pode ser executada na aba `Actions` do repositório. Ela irá criar automaticamente, após o início da execução, o cluster OKE na Oracle Cloud, conforme o `Plan` gerado no último push.

* Atenção: Antes de executar o `Apply`, valide que nenhuma outra Action está em execução, pois isso pode "quebrar" o arquivo de estado do Terraform.

# Utilizando o Terraform Destroy

A Action de `destroy` é manual e pode ser executada na aba `Actions` do repositório. Ela irá destruir automaticamente, após o início da execução, o cluster OKE na Oracle Cloud.

* Atenção: Antes de executar o `Destroy`, valide que nenhuma outra Action está em execução, pois isso pode "quebrar" o arquivo de estado do Terraform. 

# Observações sobre o Terraform

- O projeto está configurado para ser executado na região `sa-saopaulo-1` da Oracle Cloud.

- O cluster OKE será criado com 1 node pool e 2 nodes.

- Cada node possui 2 CPU e 12GB de memória e utilizam a arquitetura `arch64 (ARM)`.

- A versão do Kubernetes é a `v1.29.1`.

- Qualquer alteração nas configurações do cluster OKE pode ser feita no arquivo `variables.tf`.