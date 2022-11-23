# Funcionamento dos Secrets

- Fazer o fork desse projeto em sua conta do Github

- Para o Github rodar o pipeline, é preciso ter uma pasta .github/workflows no diretório raiz:
Foi incluído nesse workshop um diretório manifests para conter nosso arquivo de variáveis:

Entendido o funcionamento dos diretórios necessários, vamos para o primeiro assunto do workshop, Secrets e variáveis de ambiente.

### Variáveis de ambiente

É possível criar variáveis de ambiente personalizadas em seu fluxo de trabalho no Github Actions. Dessa maneira, centralizamos as variáveis e não precisamos procura-las em cada trecho de código.
Observe que no arquivo *workshop.yml* declaramos duas variáveis **$MODULO** e **$NAME**. Esse mesmos parametros são referenciados no arquivo *template.yaml*. Nesse primeiro momento entre na interface do Github e procure a aba Actions:

![m1-1](https://user-images.githubusercontent.com/15251899/203454235-4e9f1abf-2246-473a-91e1-6b51dcb932f9.jpeg)


Abra o bloco referente ao step *commands*:

![image](https://user-images.githubusercontent.com/15251899/203454743-ff433af9-edcf-406c-b040-592756621348.png)

Repare que as variáveis são substituidas como esperado. Agora altere o valor da variável **$NAME** e faça o commit. Assim que o repositório receber o novo push, será startado o pipeline.

### Secrets

Secrets são variáveis de ambiente criptografadas que podem ser usadas em um repositório e estão disponíveis para uso em fluxos de trabalho do Github Actions.

Para criar um secret execute os passos: 

1. Na interface do Github navegue até a pagina principal do repositório

2. Abaixo do nome do repositório, clique em **Settings** 
![image](https://user-images.githubusercontent.com/15251899/203456287-99c45ef9-1bfa-4d7a-9dcc-8462bad7903b.png)

3. Na sessão "Security" do lado esquerdo, selecione **Secrets**, depois **Actions**

4. Clique em **New repository secret**

5. Dê o nome de *LAST_NAME* na caixa de texto **Name**

6. Coloque como valor desse secret o seu sobrenome

7. Clique em **Add secret**


No arquivo *workshop.yml* declare o secret que acabou de criar no seguinte step:

```
    - name: Replace Variables
      uses: danielr1996/envsubst-action@1.1.0
      env:
        MODULO: ${{ env.MODULO }}
        NAME: ${{ env.NAME }}
        LAST_NAME: ${{ secrets.LAST_NAME }}
      with:
        input: "${{ github.workspace }}/.github/manifests/template.yaml"
        output: file.yaml
```

No arquivo *template.yaml* faça a inclusão da nova variável:

```
Your name: $NAME $LAST_NAME
```

OBS: Faça essa alteração em um commit só para que não seja gasto os minutos gratis disponibilizados pelo Github. Se possível utilize uma IDE como Visual Studio Code.

Feito commit e push, verifique o resultado no step de commands a aba de Actions. Você verá algo como: 