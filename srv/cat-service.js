const cds = require('@sap/cds')
module.exports = cds.service.impl( function () {
    const { Pessoa } = this.entities()
    const { Profissao } = this.entities()
    const { Carro } = this.entities()

    this.after('each', Pessoa, row => {
        console.log(`Lendo Pessoa: ${row.CPF}`)
    })

    this.after('each', Profissao, row =>{
        console.log(`Lendo Profissão: ${row.Profissao}`)
    })

    this.after('each', Carro, row =>{
        console.log(`Lendo Carro: ${row.Carro}`)
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [Pessoa], async (po, req) => {
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting: Modificado ${header.CPF}`)
            this.emit('Modificado', header)
        })
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [Profissao], async (po, req) =>{
        const header = req.data
        req.on('succeeded', () => {
            global.it || console.log(`< emitting : Modificado ${header.Profissao}`)
            this.emit('Modificado', header)
        })
    })

    this.after(['CREATE', 'UPDATE', 'DELETE'], [Carro], async (po, req) =>{
        const header = req.data
        req.on('succeeded', () =>{
            global.it || console.log(`< emitting : Modificado ${header.Carro}`)
            this.emit('Modificado', header)
        })
    })
})