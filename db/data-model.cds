namespace my.persons;

context definition {
    type cpf : String(15);

    type detalhes {
        endereco : String(40)@(title : '{i18n>adress}');
        telefone : String(15)@(title : '{i18n>phone}');
        cep      : String(8) @(title : '{i18n>codeMail}');
        cidade   : String(20)@(title : '{i18n>city}');
        bairro   : String(30)@(title : '{i18n>district}');
    };

    entity Pessoa {
        key CPF         : cpf;
            Nome        : String(30);
            Informacoes : detalhes                 @(title : '{i18n>info}');
            Profissao   : Association to Profissao @(title : '{i18n>job}');
            Carro       : Association to Carro     @(title : '{i18n>carModel}');
    };

    entity Profissao {
        key id        : Integer;
            Profissao : String(40)    @(title : '{i18n>job}');
            Descricao : String(60)    @(title : '{i18n>describ}');
            Salario   : Decimal(13, 2)@(title : '{i18n>jobPay}');
    };

    entity Carro {
        key ID_Carro : Integer;
            Modelo   : String(30);
            Valor    : Decimal(13, 2);
            Ano      : String(4);
    };
}