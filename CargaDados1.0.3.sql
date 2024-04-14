
-- -----------------------------------------------------
-- Data for table CLASSIFICACAO
-- -----------------------------------------------------

USE SisParla;

START TRANSACTION;
INSERT INTO CLASSIFICACAO (Descricao) VALUES 
('Simpatizante'),
('Vota'),
('Vota e pede voto'),
('Vota, pede voto e faz doação'),
('Vota, pede voto, faz doação e indica doador');
COMMIT;

-- -----------------------------------------------------
-- Data for table PROFISSAO
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO PROFISSAO (Nome) VALUES
('Engenheiro'),
('Médico'),
('Professor'),
('Advogado'),
('Programador'),
('Designer'),
('Enfermeiro'),
('Arquiteto'),
('Analista de Dados'),
('Chef de Cozinha'),
('Policial'),
('Bombeiro'),
('Artista'),
('Jornalista'),
('Psicólogo'),
('Cientista'),
('Farmacêutico'),
('Ator/Atriz'),
('Consultor'),
('Empresário'),
('Astrônomo'),
('Piloto'),
('Veterinário'),
('Garçom/Garçonete'),
('Geólogo'),
('Nutricionista'),
('Fotógrafo'),
('Pescador'),
('Agricultor'),
('Eletricista'),
('Encanador'),
('Motorista'),
('Carpinteiro'),
('Escritor'),
('Atleta'),
('Cientista da Computação'),
('Terapeuta'),
('Economista'),
('Designer Gráfico'),
('Analista Financeiro'),
('Pintor'),
('Biólogo'),
('Engenheiro Civil'),
('Fisioterapeuta'),
('Web Designer'),
('Técnico de Informática'),
('Tradutor'),
('Cabeleireiro/Cabeleireira'),
('Comissário de Bordo'),
('Técnico em Radiologia');

COMMIT;


-- -----------------------------------------------------
-- Data for table ESTADO
-- -----------------------------------------------------
START TRANSACTION;

INSERT ESTADO (IdEstado, UF, Nome) VALUES 
('1', 'AC', 'Acre'),
('2', 'AL', 'Alagoas'),
('3', 'AM', 'Amazonas'),
('4', 'AP', 'Amapá'),
('5', 'BA', 'Bahia'),
('6', 'CE', 'Ceará'),
('7', 'DF', 'Distrito Federal'),
('8', 'ES', 'Espírito Santo'),
('9', 'GO', 'Goiás'),
('10', 'MA', 'Maranhão'),
('11', 'MG', 'Minas Gerais'),
('12', 'MS', 'Mato Grosso do Sul'),
('13', 'MT', 'Mato Grosso'),
('14', 'PA', 'Pará'),
('15', 'PB', 'Paraíba'),
('16', 'PE', 'Pernambuco'),
('17', 'PI', 'Piauí'),
('18', 'PR', 'Paraná'),
('19', 'RJ', 'Rio de Janeiro'),
('20', 'RN', 'Rio Grande do Norte'),
('21', 'RO', 'Rondônia'),
('22', 'RR', 'Roraima'),
('23', 'RS', 'Rio Grande do Sul'),
('24', 'SC', 'Santa Catarina'),
('25', 'SE', 'Sergipe'),
('26', 'SP', 'São Paulo'),
('27', 'TO', 'Tocantins'),
('99', 'EX', 'Exterior');

COMMIT;

-- -----------------------------------------------------
-- Data for table CIDADE
-- -----------------------------------------------------
START TRANSACTION;

INSERT CIDADE (IdCidade, Nome, Estado) VALUES 
(1, 'Afonso Cláudio', 8),
(2, 'Água Doce do Norte', 8),
(3, 'Águia Branca', 8),
(4, 'Alegre', 8),
(5, 'Alfredo Chaves', 8),
(6, 'Alto Rio Novo', 8),
(7, 'Anchieta', 8),
(8, 'Apiacá', 8),
(9, 'Aracruz', 8),
(10, 'Atilio Vivacqua', 8),
(11, 'Baixo Guandu', 8),
(12, 'Barra de São Francisco', 8),
(13, 'Boa Esperança', 8),
(14, 'Bom Jesus do Norte', 8),
(15, 'Brejetuba', 8),
(16, 'Cachoeiro de Itapemirim', 8),
(17, 'Cariacica', 8),
(18, 'Castelo', 8),
(19, 'Colatina', 8),
(20, 'Conceição da Barra', 8),
(21, 'Conceição do Castelo', 8),
(22, 'Divino de São Lourenço', 8),
(23, 'Domingos Martins', 8),
(24, 'Dores do Rio Preto', 8),
(25, 'Ecoporanga', 8),
(26, 'Fundão', 8),
(27, 'Governador Lindenberg', 8),
(28, 'Guaçuí', 8),
(29, 'Guarapari', 8),
(30, 'Ibatiba', 8),
(31, 'Ibiraçu', 8),
(32, 'Ibitirama', 8),
(33, 'Iconha', 8),
(34, 'Irupi', 8),
(35, 'Itaguaçu', 8),
(36, 'Itapemirim', 8),
(37, 'Itarana', 8),
(38, 'Iúna', 8),
(39, 'Jaguaré', 8),
(40, 'Jerônimo Monteiro', 8),
(41, 'João Neiva', 8),
(42, 'Laranja da Terra', 8),
(43, 'Linhares', 8),
(44, 'Mantenópolis', 8),
(45, 'Marataízes', 8),
(46, 'Marechal Floriano', 8),
(47, 'Marilândia', 8),
(48, 'Mimoso do Sul', 8),
(49, 'Montanha', 8),
(50, 'Mucurici', 8),
(51, 'Muniz Freire', 8),
(52, 'Muqui', 8),
(53, 'Nova Venécia', 8),
(54, 'Pancas', 8),
(55, 'Pedro Canário', 8),
(56, 'Pinheiros', 8),
(57, 'Piúma', 8),
(58, 'Ponto Belo', 8),
(59, 'Presidente Kennedy', 8),
(60, 'Rio Bananal', 8),
(61, 'Rio Novo do Sul', 8),
(62, 'Santa Leopoldina', 8),
(63, 'Santa Maria de Jetibá', 8),
(64, 'Santa Teresa', 8),
(65, 'São Domingos do Norte', 8),
(66, 'São Gabriel da Palha', 8),
(67, 'São José do Calçado', 8),
(68, 'São Mateus', 8),
(69, 'São Roque do Canaã', 8),
(70, 'Serra', 8),
(71, 'Sooretama', 8),
(72, 'Vargem Alta', 8),
(73, 'Venda Nova do Imigrante', 8),
(74, 'Viana', 8),
(75, 'Vila Pavão', 8),
(76, 'Vila Valério', 8),
(77, 'Vila Velha', 8),
(78, 'Vitória', 8),
(79, 'Acrelândia', 1),
(80, 'Assis Brasil', 1),
(81, 'Brasiléia', 1),
(82, 'Bujari', 1),
(83, 'Capixaba', 1),
(84, 'Cruzeiro do Sul', 1),
(85, 'Epitaciolândia', 1),
(86, 'Feijó', 1),
(87, 'Jordão', 1),
(88, 'Mâncio Lima', 1),
(89, 'Manoel Urbano', 1),
(90, 'Marechal Thaumaturgo', 1),
(91, 'Plácido de Castro', 1),
(92, 'Porto Acre', 1),
(93, 'Porto Walter', 1),
(94, 'Rio Branco', 1),
(95, 'Rodrigues Alves', 1),
(96, 'Santa Rosa do Purus', 1),
(97, 'Sena Madureira', 1),
(98, 'Senador Guiomard', 1),
(99, 'Tarauacá', 1),
(100, 'Xapuri', 1),
(101, 'Água Branca', 2),
(102, 'Anadia', 2),
(103, 'Arapiraca', 2),
(104, 'Atalaia', 2),
(105, 'Barra de Santo Antônio', 2),
(106, 'Barra de São Miguel', 2),
(107, 'Batalha', 2),
(108, 'Belém', 2),
(109, 'Belo Monte', 2),
(110, 'Boca da Mata', 2),
(111, 'Branquinha', 2),
(112, 'Cacimbinhas', 2),
(113, 'Cajueiro', 2),
(114, 'Campestre', 2),
(115, 'Campo Alegre', 2),
(116, 'Campo Grande', 2),
(117, 'Canapi', 2),
(118, 'Capela', 2),
(119, 'Carneiros', 2),
(120, 'Chã Preta', 2),
(121, 'Coité do Nóia', 2),
(122, 'Colônia Leopoldina', 2),
(123, 'Coqueiro Seco', 2),
(124, 'Coruripe', 2),
(125, 'Craíbas', 2),
(126, 'Delmiro Gouveia', 2),
(127, 'Dois Riachos', 2),
(128, 'Estrela de Alagoas', 2),
(129, 'Feira Grande', 2),
(130, 'Feliz Deserto', 2),
(131, 'Flexeiras', 2),
(132, 'Girau do Ponciano', 2),
(133, 'Ibateguara', 2),
(134, 'Igaci', 2),
(135, 'Igreja Nova', 2),
(136, 'Inhapi', 2),
(137, 'Jacaré dos Homens', 2),
(138, 'Jacuípe', 2),
(139, 'Japaratinga', 2),
(140, 'Jaramataia', 2),
(141, 'Jequiá da Praia', 2),
(142, 'Joaquim Gomes', 2),
(143, 'Jundiá', 2),
(144, 'Junqueiro', 2),
(145, 'Lagoa da Canoa', 2),
(146, 'Limoeiro de Anadia', 2),
(147, 'Maceió', 2),
(148, 'Major Isidoro', 2),
(149, 'Mar Vermelho', 2),
(150, 'Maragogi', 2),
(151, 'Maravilha', 2),
(152, 'Marechal Deodoro', 2),
(153, 'Maribondo', 2),
(154, 'Mata Grande', 2),
(155, 'Matriz de Camaragibe', 2),
(156, 'Messias', 2),
(157, 'Minador do Negrão', 2),
(158, 'Monteirópolis', 2),
(159, 'Murici', 2),
(160, 'Novo Lino', 2),
(161, 'Olho d`Água das Flores', 2),
(162, 'Olho d`Água do Casado', 2),
(163, 'Olho d`Água Grande', 2),
(164, 'Olivença', 2),
(165, 'Ouro Branco', 2),
(166, 'Palestina', 2),
(167, 'Palmeira dos Índios', 2),
(168, 'Pão de Açúcar', 2),
(169, 'Pariconha', 2),
(170, 'Paripueira', 2),
(171, 'Passo de Camaragibe', 2),
(172, 'Paulo Jacinto', 2),
(173, 'Penedo', 2),
(174, 'Piaçabuçu', 2),
(175, 'Pilar', 2),
(176, 'Pindoba', 2),
(177, 'Piranhas', 2),
(178, 'Poço das Trincheiras', 2),
(179, 'Porto Calvo', 2),
(180, 'Porto de Pedras', 2),
(181, 'Porto Real do Colégio', 2),
(182, 'Quebrangulo', 2),
(183, 'Rio Largo', 2),
(184, 'Roteiro', 2),
(185, 'Santa Luzia do Norte', 2),
(186, 'Santana do Ipanema', 2),
(187, 'Santana do Mundaú', 2),
(188, 'São Brás', 2),
(189, 'São José da Laje', 2),
(190, 'São José da Tapera', 2),
(191, 'São Luís do Quitunde', 2),
(192, 'São Miguel dos Campos', 2),
(193, 'São Miguel dos Milagres', 2),
(194, 'São Sebastião', 2),
(195, 'Satuba', 2),
(196, 'Senador Rui Palmeira', 2),
(197, 'Tanque d`Arca', 2),
(198, 'Taquarana', 2),
(199, 'Teotônio Vilela', 2),
(200, 'Traipu', 2),
(201, 'União dos Palmares', 2),
(202, 'Viçosa', 2),
(203, 'Amapá', 4),
(204, 'Calçoene', 4),
(205, 'Cutias', 4),
(206, 'Ferreira Gomes', 4),
(207, 'Itaubal', 4),
(208, 'Laranjal do Jari', 4),
(209, 'Macapá', 4),
(210, 'Mazagão', 4),
(211, 'Oiapoque', 4),
(212, 'Pedra Branca do Amaparí', 4),
(213, 'Porto Grande', 4),
(214, 'Pracuúba', 4),
(215, 'Santana', 4),
(216, 'Serra do Navio', 4),
(217, 'Tartarugalzinho', 4),
(218, 'Vitória do Jari', 4),
(219, 'Alvarães', 3),
(220, 'Amaturá', 3),
(221, 'Anamã', 3),
(222, 'Anori', 3),
(223, 'Apuí', 3),
(224, 'Atalaia do Norte', 3),
(225, 'Autazes', 3),
(226, 'Barcelos', 3),
(227, 'Barreirinha', 3),
(228, 'Benjamin Constant', 3),
(229, 'Beruri', 3),
(230, 'Boa Vista do Ramos', 3),
(231, 'Boca do Acre', 3),
(232, 'Borba', 3),
(233, 'Caapiranga', 3),
(234, 'Canutama', 3),
(235, 'Carauari', 3),
(236, 'Careiro', 3),
(237, 'Careiro da Várzea', 3),
(238, 'Coari', 3),
(239, 'Codajás', 3),
(240, 'Eirunepé', 3),
(241, 'Envira', 3),
(242, 'Fonte Boa', 3),
(243, 'Guajará', 3),
(244, 'Humaitá', 3),
(245, 'Ipixuna', 3),
(246, 'Iranduba', 3),
(247, 'Itacoatiara', 3),
(248, 'Itamarati', 3),
(249, 'Itapiranga', 3),
(250, 'Japurá', 3),
(251, 'Juruá', 3),
(252, 'Jutaí', 3),
(253, 'Lábrea', 3),
(254, 'Manacapuru', 3),
(255, 'Manaquiri', 3),
(256, 'Manaus', 3),
(257, 'Manicoré', 3),
(258, 'Maraã', 3),
(259, 'Maués', 3),
(260, 'Nhamundá', 3),
(261, 'Nova Olinda do Norte', 3),
(262, 'Novo Airão', 3),
(263, 'Novo Aripuanã', 3),
(264, 'Parintins', 3),
(265, 'Pauini', 3),
(266, 'Presidente Figueiredo', 3),
(267, 'Rio Preto da Eva', 3),
(268, 'Santa Isabel do Rio Negro', 3),
(269, 'Santo Antônio do Içá', 3),
(270, 'São Gabriel da Cachoeira', 3),
(271, 'São Paulo de Olivença', 3),
(272, 'São Sebastião do Uatumã', 3),
(273, 'Silves', 3),
(274, 'Tabatinga', 3),
(275, 'Tapauá', 3),
(276, 'Tefé', 3),
(277, 'Tonantins', 3),
(278, 'Uarini', 3),
(279, 'Urucará', 3),
(280, 'Urucurituba', 3),
(281, 'Abaíra', 5),
(282, 'Abaré', 5),
(283, 'Acajutiba', 5),
(284, 'Adustina', 5),
(285, 'Água Fria', 5),
(286, 'Aiquara', 5),
(287, 'Alagoinhas', 5),
(288, 'Alcobaça', 5),
(289, 'Almadina', 5),
(290, 'Amargosa', 5),
(291, 'Amélia Rodrigues', 5),
(292, 'América Dourada', 5),
(293, 'Anagé', 5),
(294, 'Andaraí', 5),
(295, 'Andorinha', 5),
(296, 'Angical', 5),
(297, 'Anguera', 5),
(298, 'Antas', 5),
(299, 'Antônio Cardoso', 5),
(300, 'Antônio Gonçalves', 5),
(301, 'Aporá', 5),
(302, 'Apuarema', 5),
(303, 'Araças', 5),
(304, 'Aracatu', 5),
(305, 'Araci', 5),
(306, 'Aramari', 5),
(307, 'Arataca', 5),
(308, 'Aratuípe', 5),
(309, 'Aurelino Leal', 5),
(310, 'Baianópolis', 5),
(311, 'Baixa Grande', 5),
(312, 'Banzaê', 5),
(313, 'Barra', 5),
(314, 'Barra da Estiva', 5),
(315, 'Barra do Choça', 5),
(316, 'Barra do Mendes', 5),
(317, 'Barra do Rocha', 5),
(318, 'Barreiras', 5),
(319, 'Barro Alto', 5),
(320, 'Barro Preto (antigo Gov. Lomanto Jr.)', 5),
(321, 'Barrocas', 5),
(322, 'Belmonte', 5),
(323, 'Belo Campo', 5),
(324, 'Biritinga', 5),
(325, 'Boa Nova', 5),
(326, 'Boa Vista do Tupim', 5),
(327, 'Bom Jesus da Lapa', 5),
(328, 'Bom Jesus da Serra', 5),
(329, 'Boninal', 5),
(330, 'Bonito', 5),
(331, 'Boquira', 5),
(332, 'Botuporã', 5),
(333, 'Brejões', 5),
(334, 'Brejolândia', 5),
(335, 'Brotas de Macaúbas', 5),
(336, 'Brumado', 5),
(337, 'Buerarema', 5),
(338, 'Buritirama', 5),
(339, 'Caatiba', 5),
(340, 'Cabaceiras do Paraguaçu', 5),
(341, 'Cachoeira', 5),
(342, 'Caculé', 5),
(343, 'Caém', 5),
(344, 'Caetanos', 5),
(345, 'Caetité', 5),
(346, 'Cafarnaum', 5),
(347, 'Cairu', 5),
(348, 'Caldeirão Grande', 5),
(349, 'Camacan', 5),
(350, 'Camaçari', 5),
(351, 'Camamu', 5),
(352, 'Campo Alegre de Lourdes', 5),
(353, 'Campo Formoso', 5),
(354, 'Canápolis', 5),
(355, 'Canarana', 5),
(356, 'Canavieiras', 5),
(357, 'Candeal', 5),
(358, 'Candeias', 5),
(359, 'Candiba', 5),
(360, 'Cândido Sales', 5),
(361, 'Cansanção', 5),
(362, 'Canudos', 5),
(363, 'Capela do Alto Alegre', 5),
(364, 'Capim Grosso', 5),
(365, 'Caraíbas', 5),
(366, 'Caravelas', 5),
(367, 'Cardeal da Silva', 5),
(368, 'Carinhanha', 5),
(369, 'Casa Nova', 5),
(370, 'Castro Alves', 5),
(371, 'Catolândia', 5),
(372, 'Catu', 5),
(373, 'Caturama', 5),
(374, 'Central', 5),
(375, 'Chorrochó', 5),
(376, 'Cícero Dantas', 5),
(377, 'Cipó', 5),
(378, 'Coaraci', 5),
(379, 'Cocos', 5),
(380, 'Conceição da Feira', 5),
(381, 'Conceição do Almeida', 5),
(382, 'Conceição do Coité', 5),
(383, 'Conceição do Jacuípe', 5),
(384, 'Conde', 5),
(385, 'Condeúba', 5),
(386, 'Contendas do Sincorá', 5),
(387, 'Coração de Maria', 5),
(388, 'Cordeiros', 5),
(389, 'Coribe', 5),
(390, 'Coronel João Sá', 5),
(391, 'Correntina', 5),
(392, 'Cotegipe', 5),
(393, 'Cravolândia', 5),
(394, 'Crisópolis', 5),
(395, 'Cristópolis', 5),
(396, 'Cruz das Almas', 5),
(397, 'Curaçá', 5),
(398, 'Dário Meira', 5),
(399, 'Dias dÁvila', 5),
(400, 'Dom Basílio', 5),
(401, 'Dom Macedo Costa', 5),
(402, 'Elísio Medrado', 5),
(403, 'Encruzilhada', 5),
(404, 'Entre Rios', 5),
(405, 'Érico Cardoso', 5),
(406, 'Esplanada', 5),
(407, 'Euclides da Cunha', 5),
(408, 'Eunápolis', 5),
(409, 'Fátima', 5),
(410, 'Feira da Mata', 5),
(411, 'Feira de Santana', 5),
(412, 'Filadélfia', 5),
(413, 'Firmino Alves', 5),
(414, 'Floresta Azul', 5),
(415, 'Formosa do Rio Preto', 5),
(416, 'Gandu', 5),
(417, 'Gavião', 5),
(418, 'Gentio do Ouro', 5),
(419, 'Glória', 5),
(420, 'Gongogi', 5),
(421, 'Governador Mangabeira', 5),
(422, 'Guajeru', 5),
(423, 'Guanambi', 5),
(424, 'Guaratinga', 5),
(425, 'Heliópolis', 5),
(426, 'Iaçu', 5),
(427, 'Ibiassucê', 5),
(428, 'Ibicaraí', 5),
(429, 'Ibicoara', 5),
(430, 'Ibicuí', 5),
(431, 'Ibipeba', 5),
(432, 'Ibipitanga', 5),
(433, 'Ibiquera', 5),
(434, 'Ibirapitanga', 5),
(435, 'Ibirapuã', 5),
(436, 'Ibirataia', 5),
(437, 'Ibitiara', 5),
(438, 'Ibititá', 5),
(439, 'Ibotirama', 5),
(440, 'Ichu', 5),
(441, 'Igaporã', 5),
(442, 'Igrapiúna', 5),
(443, 'Iguaí', 5),
(444, 'Ilhéus', 5),
(445, 'Inhambupe', 5),
(446, 'Ipecaetá', 5),
(447, 'Ipiaú', 5),
(448, 'Ipirá', 5),
(449, 'Ipupiara', 5),
(450, 'Irajuba', 5),
(451, 'Iramaia', 5),
(452, 'Iraquara', 5),
(453, 'Irará', 5),
(454, 'Irecê', 5),
(455, 'Itabela', 5),
(456, 'Itaberaba', 5),
(457, 'Itabuna', 5),
(458, 'Itacaré', 5),
(459, 'Itaeté', 5),
(460, 'Itagi', 5),
(461, 'Itagibá', 5),
(462, 'Itagimirim', 5),
(463, 'Itaguaçu da Bahia', 5),
(464, 'Itaju do Colônia', 5),
(465, 'Itajuípe', 5),
(466, 'Itamaraju', 5),
(467, 'Itamari', 5),
(468, 'Itambé', 5),
(469, 'Itanagra', 5),
(470, 'Itanhém', 5),
(471, 'Itaparica', 5),
(472, 'Itapé', 5),
(473, 'Itapebi', 5),
(474, 'Itapetinga', 5),
(475, 'Itapicuru', 5),
(476, 'Itapitanga', 5),
(477, 'Itaquara', 5),
(478, 'Itarantim', 5),
(479, 'Itatim', 5),
(480, 'Itiruçu', 5),
(481, 'Itiúba', 5),
(482, 'Itororó', 5),
(483, 'Ituaçu', 5),
(484, 'Ituberá', 5),
(485, 'Iuiú', 5),
(486, 'Jaborandi', 5),
(487, 'Jacaraci', 5),
(488, 'Jacobina', 5),
(489, 'Jaguaquara', 5),
(490, 'Jaguarari', 5),
(491, 'Jaguaripe', 5),
(492, 'Jandaíra', 5),
(493, 'Jequié', 5),
(494, 'Jeremoabo', 5),
(495, 'Jiquiriçá', 5),
(496, 'Jitaúna', 5),
(497, 'João Dourado', 5),
(498, 'Juazeiro', 5),
(499, 'Jucuruçu', 5),
(500, 'Jussara', 5),
(501, 'Jussari', 5),
(502, 'Jussiape', 5),
(503, 'Lafaiete Coutinho', 5),
(504, 'Lagoa Real', 5),
(505, 'Laje', 5),
(506, 'Lajedão', 5),
(507, 'Lajedinho', 5),
(508, 'Lajedo do Tabocal', 5),
(509, 'Lamarão', 5),
(510, 'Lapão', 5),
(511, 'Lauro de Freitas', 5),
(512, 'Lençóis', 5),
(513, 'Licínio de Almeida', 5),
(514, 'Livramento de Nossa Senhora', 5),
(515, 'Luís Eduardo Magalhães', 5),
(516, 'Macajuba', 5),
(517, 'Macarani', 5),
(518, 'Macaúbas', 5),
(519, 'Macururé', 5),
(520, 'Madre de Deus', 5),
(521, 'Maetinga', 5),
(522, 'Maiquinique', 5),
(523, 'Mairi', 5),
(524, 'Malhada', 5),
(525, 'Malhada de Pedras', 5),
(526, 'Manoel Vitorino', 5),
(527, 'Mansidão', 5),
(528, 'Maracás', 5),
(529, 'Maragogipe', 5),
(530, 'Maraú', 5),
(531, 'Marcionílio Souza', 5),
(532, 'Mascote', 5),
(533, 'Mata de São João', 5),
(534, 'Matina', 5),
(535, 'Medeiros Neto', 5),
(536, 'Miguel Calmon', 5),
(537, 'Milagres', 5),
(538, 'Mirangaba', 5),
(539, 'Mirante', 5),
(540, 'Monte Santo', 5),
(541, 'Morpará', 5),
(542, 'Morro do Chapéu', 5),
(543, 'Mortugaba', 5),
(544, 'Mucugê', 5),
(545, 'Mucuri', 5),
(546, 'Mulungu do Morro', 5),
(547, 'Mundo Novo', 5),
(548, 'Muniz Ferreira', 5),
(549, 'Muquém de São Francisco', 5),
(550, 'Muritiba', 5),
(551, 'Mutuípe', 5),
(552, 'Nazaré', 5),
(553, 'Nilo Peçanha', 5),
(554, 'Nordestina', 5),
(555, 'Nova Canaã', 5),
(556, 'Nova Fátima', 5),
(557, 'Nova Ibiá', 5),
(558, 'Nova Itarana', 5),
(559, 'Nova Redenção', 5),
(560, 'Nova Soure', 5),
(561, 'Nova Viçosa', 5),
(562, 'Novo Horizonte', 5),
(563, 'Novo Triunfo', 5),
(564, 'Olindina', 5),
(565, 'Oliveira dos Brejinhos', 5),
(566, 'Ouriçangas', 5),
(567, 'Ourolândia', 5),
(568, 'Palmas de Monte Alto', 5),
(569, 'Palmeiras', 5),
(570, 'Paramirim', 5),
(571, 'Paratinga', 5),
(572, 'Paripiranga', 5),
(573, 'Pau Brasil', 5),
(574, 'Paulo Afonso', 5),
(575, 'Pé de Serra', 5),
(576, 'Pedrão', 5),
(577, 'Pedro Alexandre', 5),
(578, 'Piatã', 5),
(579, 'Pilão Arcado', 5),
(580, 'Pindaí', 5),
(581, 'Pindobaçu', 5),
(582, 'Pintadas', 5),
(583, 'Piraí do Norte', 5),
(584, 'Piripá', 5),
(585, 'Piritiba', 5),
(586, 'Planaltino', 5),
(587, 'Planalto', 5),
(588, 'Poções', 5),
(589, 'Pojuca', 5),
(590, 'Ponto Novo', 5),
(591, 'Porto Seguro', 5),
(592, 'Potiraguá', 5),
(593, 'Prado', 5),
(594, 'Presidente Dutra', 5),
(595, 'Presidente Jânio Quadros', 5),
(596, 'Presidente Tancredo Neves', 5),
(597, 'Queimadas', 5),
(598, 'Quijingue', 5),
(599, 'Quixabeira', 5),
(600, 'Rafael Jambeiro', 5),
(601, 'Remanso', 5),
(602, 'Retirolândia', 5),
(603, 'Riachão das Neves', 5),
(604, 'Riachão do Jacuípe', 5),
(605, 'Riacho de Santana', 5),
(606, 'Ribeira do Amparo', 5),
(607, 'Ribeira do Pombal', 5),
(608, 'Ribeirão do Largo', 5),
(609, 'Rio de Contas', 5),
(610, 'Rio do Antônio', 5),
(611, 'Rio do Pires', 5),
(612, 'Rio Real', 5),
(613, 'Rodelas', 5),
(614, 'Ruy Barbosa', 5),
(615, 'Salinas da Margarida', 5),
(616, 'Salvador', 5),
(617, 'Santa Bárbara', 5),
(618, 'Santa Brígida', 5),
(619, 'Santa Cruz Cabrália', 5),
(620, 'Santa Cruz da Vitória', 5),
(621, 'Santa Inês', 5),
(622, 'Santa Luzia', 5),
(623, 'Santa Maria da Vitória', 5),
(624, 'Santa Rita de Cássia', 5),
(625, 'Santa Teresinha', 5),
(626, 'Santaluz', 5),
(627, 'Santana', 5),
(628, 'Santanópolis', 5),
(629, 'Santo Amaro', 5),
(630, 'Santo Antônio de Jesus', 5),
(631, 'Santo Estêvão', 5),
(632, 'São Desidério', 5),
(633, 'São Domingos', 5),
(634, 'São Felipe', 5),
(635, 'São Félix', 5),
(636, 'São Félix do Coribe', 5),
(637, 'São Francisco do Conde', 5),
(638, 'São Gabriel', 5),
(639, 'São Gonçalo dos Campos', 5),
(640, 'São José da Vitória', 5),
(641, 'São José do Jacuípe', 5),
(642, 'São Miguel das Matas', 5),
(643, 'São Sebastião do Passé', 5),
(644, 'Sapeaçu', 5),
(645, 'Sátiro Dias', 5),
(646, 'Saubara', 5),
(647, 'Saúde', 5),
(648, 'Seabra', 5),
(649, 'Sebastião Laranjeiras', 5),
(650, 'Senhor do Bonfim', 5),
(651, 'Sento Sé', 5),
(652, 'Serra do Ramalho', 5),
(653, 'Serra Dourada', 5),
(654, 'Serra Preta', 5),
(655, 'Serrinha', 5),
(656, 'Serrolândia', 5),
(657, 'Simões Filho', 5),
(658, 'Sítio do Mato', 5),
(659, 'Sítio do Quinto', 5),
(660, 'Sobradinho', 5),
(661, 'Souto Soares', 5),
(662, 'Tabocas do Brejo Velho', 5),
(663, 'Tanhaçu', 5),
(664, 'Tanque Novo', 5),
(665, 'Tanquinho', 5),
(666, 'Taperoá', 5),
(667, 'Tapiramutá', 5),
(668, 'Teixeira de Freitas', 5),
(669, 'Teodoro Sampaio', 5),
(670, 'Teofilândia', 5),
(671, 'Teolândia', 5),
(672, 'Terra Nova', 5),
(673, 'Tremedal', 5),
(674, 'Tucano', 5),
(675, 'Uauá', 5),
(676, 'Ubaíra', 5),
(677, 'Ubaitaba', 5),
(678, 'Ubatã', 5),
(679, 'Uibaí', 5),
(680, 'Umburanas', 5),
(681, 'Una', 5),
(682, 'Urandi', 5),
(683, 'Uruçuca', 5),
(684, 'Utinga', 5),
(685, 'Valença', 5),
(686, 'Valente', 5),
(687, 'Várzea da Roça', 5),
(688, 'Várzea do Poço', 5),
(689, 'Várzea Nova', 5),
(690, 'Varzedo', 5),
(691, 'Vera Cruz', 5),
(692, 'Vereda', 5),
(693, 'Vitória da Conquista', 5),
(694, 'Wagner', 5),
(695, 'Wanderley', 5),
(696, 'Wenceslau Guimarães', 5),
(697, 'Xique-Xique', 5),
(698, 'Abaiara', 6),
(699, 'Acarape', 6),
(700, 'Acaraú', 6),
(701, 'Acopiara', 6),
(702, 'Aiuaba', 6),
(703, 'Alcântaras', 6),
(704, 'Altaneira', 6),
(705, 'Alto Santo', 6),
(706, 'Amontada', 6),
(707, 'Antonina do Norte', 6),
(708, 'Apuiarés', 6),
(709, 'Aquiraz', 6),
(710, 'Aracati', 6),
(711, 'Aracoiaba', 6),
(712, 'Ararendá', 6),
(713, 'Araripe', 6),
(714, 'Aratuba', 6),
(715, 'Arneiroz', 6),
(716, 'Assaré', 6),
(717, 'Aurora', 6),
(718, 'Baixio', 6),
(719, 'Banabuiú', 6),
(720, 'Barbalha', 6),
(721, 'Barreira', 6),
(722, 'Barro', 6),
(723, 'Barroquinha', 6),
(724, 'Baturité', 6),
(725, 'Beberibe', 6),
(726, 'Bela Cruz', 6),
(727, 'Boa Viagem', 6),
(728, 'Brejo Santo', 6),
(729, 'Camocim', 6),
(730, 'Campos Sales', 6),
(731, 'Canindé', 6),
(732, 'Capistrano', 6),
(733, 'Caridade', 6),
(734, 'Cariré', 6),
(735, 'Caririaçu', 6),
(736, 'Cariús', 6),
(737, 'Carnaubal', 6),
(738, 'Cascavel', 6),
(739, 'Catarina', 6),
(740, 'Catunda', 6),
(741, 'Caucaia', 6),
(742, 'Cedro', 6),
(743, 'Chaval', 6),
(744, 'Choró', 6),
(745, 'Chorozinho', 6),
(746, 'Coreaú', 6),
(747, 'Crateús', 6),
(748, 'Crato', 6),
(749, 'Croatá', 6),
(750, 'Cruz', 6),
(751, 'Deputado Irapuan Pinheiro', 6),
(752, 'Ererê', 6),
(753, 'Eusébio', 6),
(754, 'Farias Brito', 6),
(755, 'Forquilha', 6),
(756, 'Fortaleza', 6),
(757, 'Fortim', 6),
(758, 'Frecheirinha', 6),
(759, 'General Sampaio', 6),
(760, 'Graça', 6),
(761, 'Granja', 6),
(762, 'Granjeiro', 6),
(763, 'Groaíras', 6),
(764, 'Guaiúba', 6),
(765, 'Guaraciaba do Norte', 6),
(766, 'Guaramiranga', 6),
(767, 'Hidrolândia', 6),
(768, 'Horizonte', 6),
(769, 'Ibaretama', 6),
(770, 'Ibiapina', 6),
(771, 'Ibicuitinga', 6),
(772, 'Icapuí', 6),
(773, 'Icó', 6),
(774, 'Iguatu', 6),
(775, 'Independência', 6),
(776, 'Ipaporanga', 6),
(777, 'Ipaumirim', 6),
(778, 'Ipu', 6),
(779, 'Ipueiras', 6),
(780, 'Iracema', 6),
(781, 'Irauçuba', 6),
(782, 'Itaiçaba', 6),
(783, 'Itaitinga', 6),
(784, 'Itapagé', 6),
(785, 'Itapipoca', 6),
(786, 'Itapiúna', 6),
(787, 'Itarema', 6),
(788, 'Itatira', 6),
(789, 'Jaguaretama', 6),
(790, 'Jaguaribara', 6),
(791, 'Jaguaribe', 6),
(792, 'Jaguaruana', 6),
(793, 'Jardim', 6),
(794, 'Jati', 6),
(795, 'Jijoca de Jericoacoara', 6),
(796, 'Juazeiro do Norte', 6),
(797, 'Jucás', 6),
(798, 'Lavras da Mangabeira', 6),
(799, 'Limoeiro do Norte', 6),
(800, 'Madalena', 6),
(801, 'Maracanaú', 6),
(802, 'Maranguape', 6),
(803, 'Marco', 6),
(804, 'Martinópole', 6),
(805, 'Massapê', 6),
(806, 'Mauriti', 6),
(807, 'Meruoca', 6),
(808, 'Milagres', 6),
(809, 'Milhã', 6),
(810, 'Miraíma', 6),
(811, 'Missão Velha', 6),
(812, 'Mombaça', 6),
(813, 'Monsenhor Tabosa', 6),
(814, 'Morada Nova', 6),
(815, 'Moraújo', 6),
(816, 'Morrinhos', 6),
(817, 'Mucambo', 6),
(818, 'Mulungu', 6),
(819, 'Nova Olinda', 6),
(820, 'Nova Russas', 6),
(821, 'Novo Oriente', 6),
(822, 'Ocara', 6),
(823, 'Orós', 6),
(824, 'Pacajus', 6),
(825, 'Pacatuba', 6),
(826, 'Pacoti', 6),
(827, 'Pacujá', 6),
(828, 'Palhano', 6),
(829, 'Palmácia', 6),
(830, 'Paracuru', 6),
(831, 'Paraipaba', 6),
(832, 'Parambu', 6),
(833, 'Paramoti', 6),
(834, 'Pedra Branca', 6),
(835, 'Penaforte', 6),
(836, 'Pentecoste', 6),
(837, 'Pereiro', 6),
(838, 'Pindoretama', 6),
(839, 'Piquet Carneiro', 6),
(840, 'Pires Ferreira', 6),
(841, 'Poranga', 6),
(842, 'Porteiras', 6),
(843, 'Potengi', 6),
(844, 'Potiretama', 6),
(845, 'Quiterianópolis', 6),
(846, 'Quixadá', 6),
(847, 'Quixelô', 6),
(848, 'Quixeramobim', 6),
(849, 'Quixeré', 6),
(850, 'Redenção', 6),
(851, 'Reriutaba', 6),
(852, 'Russas', 6),
(853, 'Saboeiro', 6),
(854, 'Salitre', 6),
(855, 'Santa Quitéria', 6),
(856, 'Santana do Acaraú', 6),
(857, 'Santana do Cariri', 6),
(858, 'São Benedito', 6),
(859, 'São Gonçalo do Amarante', 6),
(860, 'São João do Jaguaribe', 6),
(861, 'São Luís do Curu', 6),
(862, 'Senador Pompeu', 6),
(863, 'Senador Sá', 6),
(864, 'Sobral', 6),
(865, 'Solonópole', 6),
(866, 'Tabuleiro do Norte', 6),
(867, 'Tamboril', 6),
(868, 'Tarrafas', 6),
(869, 'Tauá', 6),
(870, 'Tejuçuoca', 6),
(871, 'Tianguá', 6),
(872, 'Trairi', 6),
(873, 'Tururu', 6),
(874, 'Ubajara', 6),
(875, 'Umari', 6),
(876, 'Umirim', 6),
(877, 'Uruburetama', 6),
(878, 'Uruoca', 6),
(879, 'Varjota', 6),
(880, 'Várzea Alegre', 6),
(881, 'Viçosa do Ceará', 6),
(882, 'Brasília', 7),
(883, 'Abadia de Goiás', 9),
(884, 'Abadiânia', 9),
(885, 'Acreúna', 9),
(886, 'Adelândia', 9),
(887, 'Água Fria de Goiás', 9),
(888, 'Água Limpa', 9),
(889, 'Águas Lindas de Goiás', 9),
(890, 'Alexânia', 9),
(891, 'Aloândia', 9),
(892, 'Alto Horizonte', 9),
(893, 'Alto Paraíso de Goiás', 9),
(894, 'Alvorada do Norte', 9),
(895, 'Amaralina', 9),
(896, 'Americano do Brasil', 9),
(897, 'Amorinópolis', 9),
(898, 'Anápolis', 9),
(899, 'Anhanguera', 9),
(900, 'Anicuns', 9),
(901, 'Aparecida de Goiânia', 9),
(902, 'Aparecida do Rio Doce', 9),
(903, 'Aporé', 9),
(904, 'Araçu', 9),
(905, 'Aragarças', 9),
(906, 'Aragoiânia', 9),
(907, 'Araguapaz', 9),
(908, 'Arenópolis', 9),
(909, 'Aruanã', 9),
(910, 'Aurilândia', 9),
(911, 'Avelinópolis', 9),
(912, 'Baliza', 9),
(913, 'Barro Alto', 9),
(914, 'Bela Vista de Goiás', 9),
(915, 'Bom Jardim de Goiás', 9),
(916, 'Bom Jesus de Goiás', 9),
(917, 'Bonfinópolis', 9),
(918, 'Bonópolis', 9),
(919, 'Brazabrantes', 9),
(920, 'Britânia', 9),
(921, 'Buriti Alegre', 9),
(922, 'Buriti de Goiás', 9),
(923, 'Buritinópolis', 9),
(924, 'Cabeceiras', 9),
(925, 'Cachoeira Alta', 9),
(926, 'Cachoeira de Goiás', 9),
(927, 'Cachoeira Dourada', 9),
(928, 'Caçu', 9),
(929, 'Caiapônia', 9),
(930, 'Caldas Novas', 9),
(931, 'Caldazinha', 9),
(932, 'Campestre de Goiás', 9),
(933, 'Campinaçu', 9),
(934, 'Campinorte', 9),
(935, 'Campo Alegre de Goiás', 9),
(936, 'Campo Limpo de Goiás', 9),
(937, 'Campos Belos', 9),
(938, 'Campos Verdes', 9),
(939, 'Carmo do Rio Verde', 9),
(940, 'Castelândia', 9),
(941, 'Catalão', 9),
(942, 'Caturaí', 9),
(943, 'Cavalcante', 9),
(944, 'Ceres', 9),
(945, 'Cezarina', 9),
(946, 'Chapadão do Céu', 9),
(947, 'Cidade Ocidental', 9),
(948, 'Cocalzinho de Goiás', 9),
(949, 'Colinas do Sul', 9),
(950, 'Córrego do Ouro', 9),
(951, 'Corumbá de Goiás', 9),
(952, 'Corumbaíba', 9),
(953, 'Cristalina', 9),
(954, 'Cristianópolis', 9),
(955, 'Crixás', 9),
(956, 'Cromínia', 9),
(957, 'Cumari', 9),
(958, 'Damianópolis', 9),
(959, 'Damolândia', 9),
(960, 'Davinópolis', 9),
(961, 'Diorama', 9),
(962, 'Divinópolis de Goiás', 9),
(963, 'Doverlândia', 9),
(964, 'Edealina', 9),
(965, 'Edéia', 9),
(966, 'Estrela do Norte', 9),
(967, 'Faina', 9),
(968, 'Fazenda Nova', 9),
(969, 'Firminópolis', 9),
(970, 'Flores de Goiás', 9),
(971, 'Formosa', 9),
(972, 'Formoso', 9),
(973, 'Gameleira de Goiás', 9),
(974, 'Goianápolis', 9),
(975, 'Goiandira', 9),
(976, 'Goianésia', 9),
(977, 'Goiânia', 9),
(978, 'Goianira', 9),
(979, 'Goiás', 9),
(980, 'Goiatuba', 9),
(981, 'Gouvelândia', 9),
(982, 'Guapó', 9),
(983, 'Guaraíta', 9),
(984, 'Guarani de Goiás', 9),
(985, 'Guarinos', 9),
(986, 'Heitoraí', 9),
(987, 'Hidrolândia', 9),
(988, 'Hidrolina', 9),
(989, 'Iaciara', 9),
(990, 'Inaciolândia', 9),
(991, 'Indiara', 9),
(992, 'Inhumas', 9),
(993, 'Ipameri', 9),
(994, 'Ipiranga de Goiás', 9),
(995, 'Iporá', 9),
(996, 'Israelândia', 9),
(997, 'Itaberaí', 9),
(998, 'Itaguari', 9),
(999, 'Itaguaru', 9),
(1000, 'Itajá', 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table SITUACAO_CADASTRO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Ativo');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Inativo');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Pendente');
INSERT INTO SITUACAO_CADASTRO (idSituacao, Descricao) VALUES (DEFAULT, 'Dados Incompletos');

COMMIT;


-- -----------------------------------------------------
-- Data for table SITUACAO_CADASTRO
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Movimento Estudantil');
INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Sindicato');
INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Movimento Social');
INSERT INTO TIPO_ENTIDADE (Tipo) VALUES ('Outros');
COMMIT;

-- -----------------------------------------------------
-- Data for table ENTIDADE
-- -----------------------------------------------------
START TRANSACTION;


INSERT INTO PARTIDO (Nome, Sigla) VALUES
('Partido dos Trabalhadores', 'PT'),
('Partido da Social Democracia Brasileira', 'PSDB'),
('Movimento Democrático Brasileiro', 'MDB'),
('Partido Socialista Brasileiro', 'PSB'),
('Partido Democrático Trabalhista', 'PDT'),
('Partido Progressista', 'PP'),
('Partido Comunista do Brasil', 'PCdoB'),
('Partido Verde', 'PV'),
('Rede Sustentabilidade', 'REDE'),
('Partido Social Cristão', 'PSC'),
('Partido Popular Socialista', 'PPS'),
('Partido Republicano Brasileiro', 'PRB'),
('Partido Social Liberal', 'PSL'),
('Democratas', 'DEM'),
('Partido Trabalhista Brasileiro', 'PTB'),
('Partido Liberal', 'PL'),
('Solidariedade', 'SD'),
('Partido Social Democrático', 'PSD'),
('Avante', 'AVANTE'),
('Cidadania', 'CIDADANIA'),
('Partido Socialismo e Liberdade', 'PSOL'),
('Partido Republicano da Ordem Social', 'PROS'),
('Partido Trabalhista Cristão', 'PTC'),
('Partido da Mulher Brasileira', 'PMB'),
('Partido Novo', 'NOVO'),
('Partido Renovador Trabalhista Brasileiro', 'PRTB'),
('Partido Social Liberal', 'PSL'),
('Partido Socialista dos Trabalhadores Unificado', 'PSTU'),
('Partido da Mobilização Nacional', 'PMN'),
('Partido Comunista Brasileiro', 'PCB'),
('Partido Humanista da Solidariedade', 'PHS'),
('Partido Trabalhista do Brasil', 'PTdoB');

INSERT INTO ENTIDADE (Nome, Sigla, Tipo) VALUES
('Movimento dos Trabalhadores Rurais Sem Terra', 'MST', 'Movimento Social'),
('Marcha das Vadias', '', 'Movimento Social'),
('Movimento Passe Livre', 'MPL', 'Movimento Social'),
('Levante Popular da Juventude', '', 'Movimento Social'),
('Quilombo Urbano', '', 'Movimento Social'),
('Movimento Negro Unificado', 'MNU', 'Movimento Social'),
('Marcha das Margaridas', '', 'Movimento Social'),
('Movimento LGBT', '', 'Movimento Social'),
('Marcha Mundial das Mulheres', 'MMM', 'Movimento Social'),
('Coletivo de Mulheres Negras Feministas', '', 'Movimento Social');



COMMIT;
-- -----------------------------------------------------
-- Data for table ESTADO
-- -----------------------------------------------------
START TRANSACTION;


INSERT INTO ESTADO (UF, Nome) VALUES
('AC', 'Acre'),
('AL', 'Alagoas'),
('AP', 'Amapá'),
('AM', 'Amazonas'),
('BA', 'Bahia'),
('CE', 'Ceará'),
('DF', 'Distrito Federal'),
('ES', 'Espírito Santo'),
('GO', 'Goiás'),
('MA', 'Maranhão'),
('MT', 'Mato Grosso'),
('MS', 'Mato Grosso do Sul'),
('MG', 'Minas Gerais'),
('PA', 'Pará'),
('PB', 'Paraíba'),
('PR', 'Paraná'),
('PE', 'Pernambuco'),
('PI', 'Piauí'),
('RJ', 'Rio de Janeiro'),
('RN', 'Rio Grande do Norte'),
('RS', 'Rio Grande do Sul'),
('RO', 'Rondônia'),
('RR', 'Roraima'),
('SC', 'Santa Catarina'),
('SP', 'São Paulo'),
('SE', 'Sergipe'),
('TO', 'Tocantins');
COMMIT;


/* INSERÇÃO DE DADOS ESPECIFICOS POR SISTEMA...  */
START TRANSACTION;


-- INSERT SISTEMA VALUES (1, 'Mandato Adriana Accorsi', 'S' );


INSERT REGRA_ACESSO VALUES
(1,'ADM', 'Administrador do Sistema'),
(2, 'AC1', 'Acessor Nível I');


INSERT STATUS_USUARIO VALUES
(1, 'Ativo');



INSERT USUARIO VALUES 
(1, 'Gustavo Faquim', 'gustavofaquim', '$2b$10$DxQHuPrQgnv3L/Zr5nUvau.c8ynnL3M.KtxJK2w4QZ8YDUwTRlLWa', '62996828796', 1, 1),
(2, 'Marcos Soares', 'marcos.soares', '$2b$10$DxQHuPrQgnv3L/Zr5nUvau.c8ynnL3M.KtxJK2w4QZ8YDUwTRlLWa', NULL, 2, 1);


INSERT GRUPO  (Nome, Responsavel) VALUES 
('Estudantes UFG', 2);

INSERT SITUACAO_DEMANDA VALUES 
(NULL, 'Aberta'),
(NULL, 'Em atendimento'),
(NULL, 'Aguardando parecer'),
(NULL, 'Concluida'); 


INSERT CATEGORIA_DEMANDA VALUES
(NULL, 'Reunião'),
(NULL, 'Evento'),
(NULl, 'Doação'),
(NULL, 'Emenda'),
(NULL, 'Outras');


INSERT TIPO_DESPESA VALUES
(NULL,'Aluguel de veículos'),
(NULL,'Divulgação da atividade parlamentar'),
(NULL,'Manutenção de escritório'),
(NULL,'Combustíveis'),
(NULL,'Passagem Aérea'),
(NULL,'Outros');

INSERT ORIGEM_DESPESA VALUES 
(NULL, 'Mandato', '2024'),
(NULL, 'Pré-Candidatura Prefeitura', '2024'),
(NULL, 'Candidatura Prefeitura', '2024');


INSERT RELIGIAO (Nome) VALUES
('Evangélico'), ('Católico'), ('Testemunha de Jeová');

COMMIT;

-- INSERT INTO CREDOR (IdCredor, Nome, Endereco, Telefone, Tipo, Documento) 
-- VALUES (NULL,'Faquim - Consultoria em Tecnologia da Informação', 1, '33333333', 'Pessoa Juridica', '45454545454545');

-- INSERT INTO ORIGEM_DESPESA (Descricao, Ano) VALUES ('Mandato', '2023');

-- INSERT INTO TIPO_DESPESA (Descricao) VALUES ('Assessoria Tecnologica');

-- INSERT INTO DESPESA (Descricao, Valor, Data, PessoaJuridicaFisica, Origem, Tipo ) VALUES ('Sistema de gerenciamento do mandato e limpeza de dados', 125.000, '2024-01-15',1,1,1  );

