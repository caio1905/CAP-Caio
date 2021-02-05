using my.persons.definition as my from './data-model';

annotate my.Pessoa with @(
    title       : '{i18n>tableT}',
    description : '{i18n>tableT}'
) {
    CPF @(
        title       : '{i18n>numPeoples}',
        description : '{i18n>numPeoples}'
    );
        Nome @(
        title       : '{i18n>name}',
        description : '{i18n>name}'
    );
}
