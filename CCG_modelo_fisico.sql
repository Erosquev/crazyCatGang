CREATE SCHEMA crazy_cat_gang;

USE crazy_cat_gang;


CREATE TABLE IF NOT EXISTS tb_gato(
	id_gato INTEGER AUTO_INCREMENT NOT NULL,
    nome_gato VARCHAR(20),
    sexo_gato VARCHAR(10) NOT NULL,
    data_nasc_gato DATE,
    rua_gato VARCHAR(100),
    logradouro_gato VARCHAR(5),
    cidade_gato VARCHAR(20),
    data_chegada_gato DATE,
	data_saida_gato DATE,
    peso_gato DECIMAL(3,2),
    obs_gato TEXT,
    
    PRIMARY KEY(id_gato)
);

CREATE TABLE IF NOT EXISTS tb_clinica(
	cnpj_clinica VARCHAR(14) NOT NULL,
	nome_clinica VARCHAR(100),
	rua_clinica VARCHAR(100),
	logradouro_clinica VARCHAR(5),
	cidade_clinica VARCHAR(20),
        
	PRIMARY KEY(cnpj_clinica)
);


CREATE TABLE IF NOT EXISTS tb_agendamento(
	id_ag INTEGER AUTO_INCREMENT NOT NULL,
    id_gato INTEGER,
    responsavel_ag VARCHAR(100),
    data_hora_ag DATETIME,
    profissional_ag VARCHAR(100),
    preco_ag DECIMAL(5,2),
    cnpj_clinica VARCHAR(14),
    
    PRIMARY KEY(id_ag),
    FOREIGN KEY(id_gato) REFERENCES tb_gato(id_gato),
    FOREIGN KEY (cnpj_clinica) REFERENCES tb_clinica(cnpj_clinica)
    );
    
    CREATE TABLE IF NOT EXISTS tb_pagamento(
		id_pagamento INTEGER AUTO_INCREMENT NOT NULL,
        cnpj_clinica VARCHAR(14),
        data_hora_pagamento DATETIME,
        valor_pagamento DECIMAL(5,2),
        tipo_pagamento VARCHAR(15),
        
        PRIMARY KEY(id_pagamento),
        FOREIGN KEY(cnpj_clinica) REFERENCES tb_clinica(cnpj_clinica)
    );
    
    CREATE TABLE IF NOT EXISTS tb_gato_agendado(
		id_gato INTEGER NOT NULL,
        id_ag INTEGER NOT NULL,
        FOREIGN KEY(id_gato) REFERENCES tb_gato(id_gato),
        FOREIGN KEY(id_ag) REFERENCES tb_agendamento(id_ag)
    );
    
    CREATE TABLE IF NOT EXISTS tb_cirurgia(
		id_cirurgia INTEGER AUTO_INCREMENT NOT NULL,
        data_hora_cirurgia DATETIME,
        medicamentos_cirurgia TEXT,
        tempo_repouso_cirurgia VARCHAR(20),
        data_hora_reconsulta_cirurgia DATETIME,
        id_ag INTEGER,
        id_gato INTEGER,
        
        PRIMARY KEY(id_cirurgia),
        FOREIGN KEY(id_ag) REFERENCES tb_agendamento(id_ag),
        FOREIGN KEY(id_gato) REFERENCES tb_gato(id_gato)
    );
    
    CREATE TABLE IF NOT EXISTS tb_gato_castrado(
		id_gato INTEGER,
		id_cirurgia INTEGER NOT NULL,
        FOREIGN KEY(id_gato) REFERENCES tb_gato(id_gato),
        FOREIGN KEY(id_cirurgia) REFERENCES tb_cirurgia(id_cirurgia)
    );
    

