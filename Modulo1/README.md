# Funcionamento dos Secrets

- Fazer o fork desse projeto em sua conta do Github

- Para o Github rodar o pipeline, é preciso ter uma pasta .github/workflows no diretório raiz:
Foi incluído nesse workshop um diretório manifests para conter nosso arquivo de variáveis:


Entendido o funcionamento dos diretórios necessários, vamos para o primeiro assunto do workshop, Secrets e variáveis de ambiente.

É possível criar variáveis de ambiente personalizadas em seu fluxo de trabalho no Github Actions. Dessa maneira, centralizamos as variáveis e não precisamos procura-las em cada trecho de código.
Observe que no arquivo workshop.yml declaramos duas variáveis $MODULO e $NAME. Esse mesmos parametros são referenciados no arquivo template.yaml. Nesse primeiro momento entre na interface do Github e procure a aba Actions:

![](https://github.com/vanessafso/poc-simple-app/tree/main/images/m1-1.jpeg)






Secrets são variáveis de ambiente criptografadas que podem ser usadas em um repositório e estão disponíveis para uso em fluxos de trabalho do Github Actions.