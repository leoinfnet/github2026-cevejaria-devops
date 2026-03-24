-- =========================
-- TABELAS BASE
-- =========================

CREATE TABLE estilo (
                        id BIGSERIAL PRIMARY KEY,
                        nome VARCHAR(255)
);

CREATE TABLE marcas (
                        id BIGSERIAL PRIMARY KEY,
                        nome VARCHAR(255) NOT NULL,
                        email VARCHAR(255),
                        pais VARCHAR(30) NOT NULL,
                        data_fundacao DATE
);

CREATE TABLE lupulo (
                        id BIGSERIAL PRIMARY KEY,
                        nome VARCHAR(255),
                        descricao VARCHAR(5000)
);

CREATE TABLE role (
                      id BIGSERIAL PRIMARY KEY,
                      nome VARCHAR(255)
);

CREATE TABLE usuario (
                         id BIGSERIAL PRIMARY KEY,
                         nome VARCHAR(255),
                         email VARCHAR(255),
                         password VARCHAR(255),
                         status INTEGER
);

-- =========================
-- TABELA PRINCIPAL
-- =========================

CREATE TABLE cerveja (
                         id BIGSERIAL PRIMARY KEY,
                         nome VARCHAR(255),
                         estilo_id BIGINT,
                         marca_id BIGINT,

                         CONSTRAINT FKiit974t1gqr90qrlidnp1lnqn
                             FOREIGN KEY (estilo_id) REFERENCES estilo(id),

                         CONSTRAINT FKrri9jgyd2kxpr1vvcbw2od8l5
                             FOREIGN KEY (marca_id) REFERENCES marcas(id)
);

-- =========================
-- TABELAS DE RELACIONAMENTO
-- =========================

CREATE TABLE cerveja_curtidas (
                                  cerveja_id BIGINT NOT NULL,
                                  curtidas_id BIGINT NOT NULL,

                                  PRIMARY KEY (cerveja_id, curtidas_id),

                                  CONSTRAINT FKd4i102rl8qcybfjqma33um4tf
                                      FOREIGN KEY (cerveja_id) REFERENCES cerveja(id),

                                  CONSTRAINT FKpf6cjc8yngje9wyben3eqjgfx
                                      FOREIGN KEY (curtidas_id) REFERENCES usuario(id)
);

CREATE TABLE cerveja_lupulos (
                                 cerveja_id BIGINT NOT NULL,
                                 lupulos_id BIGINT NOT NULL,

                                 PRIMARY KEY (cerveja_id, lupulos_id),

                                 CONSTRAINT FKdhnqxdtm8ubpq39wtmgyquehk
                                     FOREIGN KEY (cerveja_id) REFERENCES cerveja(id),

                                 CONSTRAINT FKi8lngqoy6wy9tthi0089y4mye
                                     FOREIGN KEY (lupulos_id) REFERENCES lupulo(id)
);

CREATE TABLE lupulo_cervejas (
                                 cervejas_id BIGINT NOT NULL,
                                 lupulo_id BIGINT NOT NULL,

                                 PRIMARY KEY (cervejas_id, lupulo_id),

                                 CONSTRAINT FKelfj1nmj2u3t3u387cvkegclt
                                     FOREIGN KEY (cervejas_id) REFERENCES cerveja(id),

                                 CONSTRAINT FKqqigr1e53ll9hvh3ebd12g895
                                     FOREIGN KEY (lupulo_id) REFERENCES lupulo(id)
);

CREATE TABLE usuario_cervejas_curtidas (
                                           cervejas_curtidas_id BIGINT NOT NULL,
                                           usuario_id BIGINT NOT NULL,

                                           PRIMARY KEY (cervejas_curtidas_id, usuario_id),

                                           CONSTRAINT FK50wg43d6bg88w2hwmcqyigi3p
                                               FOREIGN KEY (cervejas_curtidas_id) REFERENCES cerveja(id),

                                           CONSTRAINT FKl3grdcctknlgsskhs56xw8lfc
                                               FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE usuario_roles (
                               roles_id BIGINT NOT NULL,
                               usuario_id BIGINT NOT NULL,

                               PRIMARY KEY (roles_id, usuario_id),

                               CONSTRAINT FKr5p0u8r15jjo6u7xr1928hsld
                                   FOREIGN KEY (roles_id) REFERENCES role(id),

                               CONSTRAINT FKqblnumndby0ftm4c7sg6uso6p
                                   FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);