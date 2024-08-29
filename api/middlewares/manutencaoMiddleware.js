// Classe que representara o middleware
class ManutencaoMiddleware {
    // injeção de dependencia atraves do metodo construtor
    constructor(estaDisponivel) {
        this.estaDisponivel = estaDisponivel
    }

    // metodo para checar se a API está em manutenção
    verificandoDisponibilidade(req, res, next) {
        if(!this.estaDisponivel){
            return res.status(503).json({message: 'API em manutenção, tente novamente mais tarde.'})
        }

        next()
    }
}

export default ManutencaoMiddleware