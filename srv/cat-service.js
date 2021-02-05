const cds = require('@sap/cds')
module.exports = cds.service.impl( function () {
    const { Pessoa } = this.entities()

    this.after('each', Pessoa, row => {
        console.log(`Lendo Pessoa: ${row.CPF}`)
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [Pessoa], async (po, req) => {
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting: Modificado ${header.CPF}`)
            this.emit('Modificado', header)
        })
    })
})