# infra-ecs-aws-tech-challenge

### Descrição
Este projeto visa automatizar a criação de um [Amazon Elastic Container Service (ECS)](https://aws.amazon.com/pt/ecs/) usando [GitHub Workflow](https://docs.github.com/pt/actions) em uma conta AWS utilizando o terraform. é um serviço totalmente gerenciado de orquestração de contêineres que ajuda a implantar, gerenciar e escalar aplicações em contêineres de maneira mais eficiente.

## Membros do Grupo 2
- [Danilo Monteiro](https://github.com/dmonteirosouza)
- [Marcel Cozono](https://github.com/macozono)
- [Viviane Scarlatti](https://github.com/viviane-scarlatti)
- [Vinicius Furin](https://github.com/VFurin)
- [Vitor Walcker](https://github.com/VitorWalcker)

## Configuração

1. **Pré-requisitos:**
    - Conta ativa na AWS.
    - Conhecimento básico de GitHub Actions.
    - Ter o [terraform](https://developer.hashicorp.com/terraform/downloads) instalado.
    - Ter o [AWS CLI](https://aws.amazon.com/pt/cli/) instalado.
  
2. **Configuração inicial:**
    - Após fazer o clone do projeto você já consegue executar os comando locais do terraform
    - Configure as [credenciais de acesso no GitHub](https://docs.github.com/pt/actions/security-guides/using-secrets-in-github-actions) para fazer o deploy em uma conta exclusiva.
  
## Estrutura do Projeto

A estrutura do projeto está composta da seguinte maneira, na pasta .github encontramos os arquivos do workflow responsavel por acionar a esteira e executar os steps, já a pasta infra estão todos os arquivos utilizado para gerar os recursos de infra estrutura. 

```
projeto/
  ├── .github/
  │   ├── workflows/
  │   │   └── infra-aws-ecs-terraform.yml
  ├── infra/
      ├── alb.tf
      ├── locals.tf
      ├── main.tf
      ├── providers.tf
      ├── vpc.tf
      ├── variables.tf      
```
## Fluxo de Trabalho

O fluxo do workflow usando neste projeto é o seguinte:

1. Ele executa o checkout do repositorio;
2. Faz todo o setup para utilizar o Terraform;
3. Executa a configuração das Credencias da AWS;
4. Faz o step do terraform Format;
5. Faz o step do terraform Init;
6. Faz o step do terraform Validate;
7. Faz o step do terraform Plan;
8. Faz o step do terraform Apply;
9. Faz o step do Clean do arquivo do Plan;
