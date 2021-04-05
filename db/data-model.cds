namespace model;

context definition {
    type cpf : String(15);

    type detalhes {
        endereco : String(40)@(title : '{i18n>adress}');
        telefone : String(15)@(title : '{i18n>phone}');
        cep      : String(8) @(title : '{i18n>codeMail}');
        cidade   : String(20)@(title : '{i18n>city}');
        bairro   : String(30)@(title : '{i18n>district}');
    }

    entity Pessoa {
        key CPF              : cpf;
            Nome             : String(30);
            Informacoes      : detalhes @(title : '{i18n>info}');
            ID_REQUEST_CARRO : Association to many model.definition.Carro
                                   on ID_REQUEST_CARRO.ID_REQUEST = CPF;
    }

    entity Carro {
        key ID_REQUEST : String(10);
        key ID_Carro   : Integer;
            Modelo     : String(30);
            Valor      : Decimal(13, 2);
            Ano        : String(4);
    }
}
