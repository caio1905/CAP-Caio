using model as my from '../db/data-model';

service CatalogService {
    entity Pessoa as projection on my.definition.Pessoa;
    entity Profissao as projection on my.definition.Profissao;
    entity Carro as projection on my.definition.Carro;
}