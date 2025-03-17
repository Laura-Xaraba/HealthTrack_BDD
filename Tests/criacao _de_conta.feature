Feature: Criação de Conta
    Como um novo usuário,
    Quero criar uma conta,
    Para que possa acessar o sistema HealthTrack e gerenciar meus dados de saúde.

    Background: Dado que o usuário está na página de cadastro

    @positive @valid-data
    Scenario: Criar conta com dados válidos
        When o usuário preenche o nome de usuário "usuario123"
        And preenche o e-mail "usuario@email.com"
        And preenche a senha "Senha@123"
        And preenche a idade "25"
        And clica no botão "Criar conta"
        Then a conta deve ser criada com sucesso
        And uma mensagem de confirmação deve ser exibida

    @negative @invalid-password
    Scenario: Criar uma conta coms enha inválida
        When o usuário preenche o nome de usuário "usuario123"
        And preenche o e-mail "usuario@email.com"
        And preenche a senha "senha123"
        And preenche a idade "25"
        And clica no botão "Criar conta"
        Then uma mensagem de erro deve ser exibida informando que a senha deve ter entre 8 e 12 caracteres e incluir pelo menos um número e um caractere especial

    @negative @invalid-age
    Scenario: Criar uma conta com idade fora do intervalo permitido
        When o usuário preenche o nome de usuário "usuario123"
        And preenche o e-mail "usuario@email.com"
        And preenche a senha "Senha@123"
        And preenche a idade "15"
        And clica no botão "Criar conta"
        Then uma mensagem de erro deve ser exibida informando que a idade deve estar entra 18 e 100 anos

    @negative @invalid-email
    Scenario: Criar uma conta com e-mail inválido
        When o usuário preenche o nome de usuário "usuario123"
        And preenche o e-mail "usuario@email"
        And preenche a senha "Senha@123"
        And preenche a idade "25"
        And clica no botão "Criar conta"
        Then uma mensagem de erro deve ser exibida informando que o e-mail deve estar em um formato válido

    @negative @password-length
    Scenario: Criar uma conta com senha fora do tamanho permitido
        When o usuário preenche o nome de usuário "usuario123"
        And preenche o e-mail "usuario@email.com"
        And preenche a senha "S@123"
        And preenche a idade "25"
        And clica no botão "Criar conta"
        Then uma mensagem de erro deve ser exibida informando que a senha deve ter entre 8 e 12 caracteres e incluir pelo menos um número e um caractere especial