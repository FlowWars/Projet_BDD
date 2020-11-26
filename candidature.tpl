<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="images/logo-squirrel.png">
        <title>Squirrel - Register</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&family=Nerko+One&family=Noto+Sans+JP:wght@100;300&display=swap" rel="stylesheet">     </head> 
    <body>
        <div class="jumbotron" id="body-main">
            <div id="boxlogo">
                <img src="images/logo-squirrel.png" id="logo" alt="logo">
                <p>SQUIRREL</p>
            </div>
            
            <form style="border-radius: 3px;" method="POST">
                <h1 class="display-4" id="title-form">Inscription</h1>
                <section class="sectionSpace">
                    <div class="form-group">
                        <label for="inputNameOfGroup">Nom du groupe</label>
                        <input type="text" name="nom" class="form-control" value={$nom} > {$message.nom|default:''}
                    </div>
                    <div class="form-group">
                        <label for="inputOriginDepartement">Département d'origine</label>
                        <div>
                            <select class="custom-select" id="inputGroupSelect01" name="departement" >{$message.departement|default:''}
                                <option value""></option>
                                <option value="1">01-Ain</option>
                                <option value="2">02-Aisne</option>
                                <option value="3">03-Allier</option>
                                <option value="4">04-Alpes-de-Haute-Provence</option>
                                <option value="5">05-Hautes-Alpes</option>
                                <option value="6">06-Alpes-Maritimes</option>
                                <option value="7">07-Ardèche</option>
                                <option value="8">08-Ardennes</option>
                                <option value="9">09-Ariège</option>
                                <option value="10">10-Aube</option>
                                <option value="11">11-Aude</option>
                                <option value="12">12-Aveyron</option>
                                <option value="13">13-Bouches-du-Rhône</option>
                                <option value="14">14-Calvados</option>
                                <option value="15">15-Cantal</option>
                                <option value="16">16-Charente</option>
                                <option value="17">17-Charente-Maritime</option>
                                <option value="18">18-Cher</option>
                                <option value="19">19-Corrèze</option>
                                <option value="20">2A-2B-Corse</option>
                                <option value="21">21-Côte-d'Or</option>
                                <option value="22">22-Côtes d'Armor</option>
                                <option value="23">23-Creuse</option>
                                <option value="24">24-Dordogne</option>
                                <option value="25">25-Doubs</option>
                                <option value="26">26-Drôme</option>
                                <option value="27">27-Eure</option>
                                <option value="28">28-Eure-et-Loir</option>
                                <option value="29">29-Finistère</option>
                                <option value="30">30-Gard</option>
                                <option value="31">31-Haute-Garonne</option>
                                <option value="32">32-Gers</option>
                                <option value="33">33-Gironde</option>
                                <option value="34">34-Hérault</option>
                                <option value="35">35-Ille-et-Vilaine</option>
                                <option value="36">36-Indre</option>
                                <option value="37">37-Indre-et-Loire</option>
                                <option value="38">38-Isère</option>
                                <option value="39">39-Jura</option>
                                <option value="40">40-Landes</option>
                                <option value="41">41-Loir-et-Cher</option>
                                <option value="42">42-Loire</option>
                                <option value="43">43-Haute-Loire</option>
                                <option value="44">44-Loire-Atlantique</option>
                                <option value="45">45-Loiret</option>
                                <option value="46">46-Lot</option>
                                <option value="47">47-Lot-et-Garonne</option>
                                <option value="48">48-Lozère</option>
                                <option value="49">49-Maine-et-Loire</option>
                                <option value="50">50-Manche</option>
                                <option value="51">51-Marne</option>
                                <option value="52">52-Haute-Marne</option>
                                <option value="53">53-Mayenne</option>
                                <option value="54">54-Meurthe-et-Moselle</option>
                                <option value="55">55-Meuse</option>
                                <option value="56">56-Morbihan</option>
                                <option value="57">57-Moselle</option>
                                <option value="58">58-Nièvre</option>
                                <option value="59">59-Nord</option>
                                <option value="60">60-Oise</option>
                                <option value="61">61-Orne</option>
                                <option value="62">62-Pas-de-Calais</option>
                                <option value="63">63-Puy-de-Dôme</option>
                                <option value="64">64-Pyrénées-Atlantiques</option>
                                <option value="65">65-Hautes-Pyrénées</option>
                                <option value="66">66-Pyrénées-Orientales</option>
                                <option value="67">67-Bas-Rhin</option>
                                <option value="68">68-Haut-Rhin</option>
                                <option value="69">69-Rhône</option>
                                <option value="70">70-Haute-Saône</option>
                                <option value="71">71-Saône-et-Loire</option>
                                <option value="72">72-Sarthe</option>
                                <option value="73">73-Savoie</option>
                                <option value="74">74-Haute-Savoie</option>
                                <option value="75">75-Paris</option>
                                <option value="76">76-Seine-Maritime</option>
                                <option value="77">77-Seine-et-Marne</option>
                                <option value="78">78-Yvelines</option>
                                <option value="79">79-Deux-Sèvres</option>
                                <option value="80">80-Somme</option>
                                <option value="81">81-Tarn</option>
                                <option value="82">82-Tarn-et-Garonne</option>
                                <option value="83">83-Var</option>
                                <option value="84">84-Vaucluse</option>
                                <option value="85">85-Vendée</option>
                                <option value="86">86-Vienne</option>
                                <option value="87">87-Haute-Vienne</option>
                                <option value="88">88-Vosges</option>
                                <option value="89">89-Yonne</option>
                                <option value="90">90-Territoire de Belfort</option>
                                <option value="91">91-Essonne</option>
                                <option value="92">92-Hauts-de-Seine</option>
                                <option value="93">93-Seine-St-Denis</option>
                                <option value="94">94-Val-de-Marne</option>
                                <option value="95">95-Val-D'Oise</option>
                               

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTypeOfScene">Type de scène</label>
                        <div>
                            <select name="scene" class="custom-select" id="inputGroupSelect01">
                                <option value=""></option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="formGroupExampleInput">Style de musique</label>
                            <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Rock, Punk, Indie Rock, etc.">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="formGroupExampleInput">Année de création</label>
                            <input type="text" class="form-control" id="formGroupExampleInput">
                        </div>
                    </div>
                    <div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Présentation du groupe</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Veuillez décrire votre groupe en quelques mots (moins de 500 caractères)..." rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Expériences scéniques</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Veuillez nous renseigner votre expérience scénique (moins de 500 caractères)..." rows="3"></textarea>
                        </div>
                    </div>
                    <div>
                        <label for="basic-url">Sites WEB</label>
                        <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon3">Site web ou Facebook (url)</span>
                        </div>
                        <input type="text" class="form-control" aria-describedby="basic-addon3">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3">Adresse page Soundcloud</span>
                            </div>
                            <input type="text" class="form-control" aria-describedby="basic-addon3" placeholder="(facultatif)">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3">Adresse page Youtube</span>
                            </div>
                            <input type="text" class="form-control" aria-describedby="basic-addon3" placeholder="(facultatif)">
                        </div>
                    </div>
                    <div>
                        <div class="row">
                            <div class="col-sm">
                                <h6>Statut associatif</h6>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="assoStat" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">Oui</label>
                                </div>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="assoStat" value="option2">
                                    <label class="form-check-label" for="inlineRadio2">Non</label>
                                </div>
                            </div>
                            <div class="col-sm">
                                <h6>Inscrit à la SACEM</h6>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="sacem" value="option3">
                                    <label class="form-check-label" for="inlineRadio3">Oui</label>
                                </div>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="sacem" value="option4">
                                    <label class="form-check-label" for="inlineRadio4">Non</label>
                                </div>
                            </div>
                            <div class="col-sm">
                                <h6>Producteur</h6>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="product" value="option5">
                                    <label class="form-check-label" for="inlineRadio5">Oui</label>
                                </div>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="product" value="option6">
                                    <label class="form-check-label" for="inlineRadio6">Non</label>
                                </div>
                            </div>
                        </div>
                    </div> 
                </section>
                <hr class="my-4">
                <section class="sectionSpace">
                    <div>
                        <h2 class="display-7">Membres du groupe (1 à 8 membre.s.)</h2>
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <h4>Membre n°1</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAddress">Instrument</label>
                                            <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                        </div>
                                </div>
                                <div class="col">
                                    <h4>Membre n°2</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                        <h4>Membre n°3</h4>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="inputEmail4">Nom</label>
                              <input type="email" class="form-control" id="inputEmail4">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Prénom</label>
                                <input type="email" class="form-control" id="inputEmail4">
                              </div>
                          </div>
                          <div class="form-group">
                            <label for="inputAddress">Instrument</label>
                            <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                        </div>
                                </div>
                                <div class="col">
                                    <h4>Membre n°4</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h4>Membre n°5</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div> 
                                </div>
                                <div class="col">
                                    <h4>Membre n°6</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h4>Membre n°7</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div> 
                                </div>
                                <div class="col">
                                    <h4>Membre n°8</h4>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputEmail4">Nom</label>
                                          <input type="email" class="form-control" id="inputEmail4">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Prénom</label>
                                            <input type="email" class="form-control" id="inputEmail4">
                                          </div>
                                      </div>
                                      <div class="form-group">
                                        <label for="inputAddress">Instrument</label>
                                        <input type="text" class="form-control" id="inputInstrument" placeholder="Trompette, batterie, guitare...">
                                    </div> 
                                </div>
                            </div>
                        </div>                                                                                                
                    </div> 
                </section>
                <hr class="my-4">
                <section class="sectionSpace">
                <div>    
                    <h2 class="display-7">Représentant du groupe</h2>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="inputEmail4">Nom</label>
                          <input type="email" class="form-control" id="inputEmail4">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Prénom</label>
                            <input type="email" class="form-control" id="inputEmail4">
                          </div>
                      </div>
                      <div class="form-group">
                        <label for="inputAddress">Adresse</label>
                        <input type="text" class="form-control" id="inputAddress" placeholder="1234 rue de l'exemple">
                      </div>
                      <div class="form-group">
                        <label for="inputAddress2">Complément d'adresse</label>
                        <input type="text" class="form-control" id="inputAddress2" placeholder="Appartement, bâtiment, numéro de porte">
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="inputCity">Ville</label>
                          <input type="text" class="form-control" id="inputCity">
                        </div>
                        <div class="form-group col-md-4">
                          <label for="inputState">Code postal</label>
                          <input type="text" class="form-control" id="inputCity"> 
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputEmail4">Téléphone</label>
                        <input type="email" class="form-control" id="inputEmail4">
                      </div>
                    </div>
                </div>                        
                </section>
                <hr class="my-4">
                <section class="sectionSpace">
                    <div>
                        <h4>Veuillez nous partager 3 de vos titres musical (Format MP3)</h4>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Morceau n°1</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Morceau n°2</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Morceau n°3</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>                
                </section>
                <hr class="my-4">
                <section class="sectionSpace">
                    <div>
                        <h4>Veuillez nous partager 2 photos du groupe (Résolution >300 dpi)</h4>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Photo n°1</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Photo n°2</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>                                   
                    </div>                    
                </section>
                <hr class="my-4">
                <section class="sectionSpace">
                    <div>
                        <h4>Veuillez nous renseigner une fiche technique et un document SACEM (format .PDF)</h4>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Fiche technique</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Document SACEM</label>
                                <input type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>
                        </div>
                    </div>                    
                </section>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Confirmer</button>
            </form>
        </div>
    </body>
</html>