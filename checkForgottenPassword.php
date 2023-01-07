<?php

    include 'imports/dbSetting.php';

    require '../libraries/PHPMailer/src/Exception.php';
    require '../libraries/PHPMailer/src/PHPMailer.php';
    require '../libraries/PHPMailer/src/SMTP.php';

    require_once '../libraries/GoogleAuthenticator-master/PHPGangsta/GoogleAuthenticator.php';

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    use PHPMailer\PHPMailer\SMTP;

    //Deklaration alles benötigter Variablen

    $emailForm=""; // wird erfolgreich übergeben
    $twoFAForm=""; // wird erfolgreich übergeben

    $emailDB=""; //
    $secretDB=""; //
    $newPassword="";
    $hasNewPassword=0;
    $vorname="";
    $ga = new PHPGangsta_GoogleAuthenticator();     //Instanz der Klasse erstellen für die 2FA Abfrage

    try{
        try {

            if(isset($_POST['email']) && isset($_POST['2FA'])){
                $emailForm = $_POST['email'];
                $twoFAForm = $_POST['2FA'];
            }
                
            $sql = "SELECT email, secret, vorname FROM kunde WHERE email='".$emailForm."';";
    
            $stmt = MySQLi_query($con, $sql);
            
            //Checkt die Anzahl der Datensätze und wirft eine Exception, wenn 0
            if(mysqli_num_rows($stmt) === 0){
                throw new Exception("Ups, da scheint etwas schief gelaufen zu sein. Check nochmal die von dir eingegebenen Daten!");
            }
    
        }catch(PDOException $e){
            echo "Hier ist der Fehler!";
        }
            //Get the Value og the 
            foreach($conn-> query($sql) as $row){
                $emailDB = $row['email'];
                $secretDB = $row['secret'];
                $vorname = $row['vorname'];
            }

            echo $emailForm."<br>";
            echo $twoFAForm."<br>";
            

            echo $emailDB."<br>";
            echo $secretDB."<br>";
            echo $vorname."<br>";
            
            //Ein zufälliges Passwort wird generiert
            $bytes = openssl_random_pseudo_bytes(4);
            $newPassword = bin2hex($bytes);

            //PHP Gangsta Objekt ruft Methode auf, um den aktuellen Code zu kriegen 
            //mit dem Parameter "secret" aus der Datenbank
            $oneCode = $ga->getCode($secretDB);

            $checkResult = $ga->verifyCode($secretDB, $oneCode, 2);

            //Wirft Exception wenn Code nicht übereinstimmt
            if($checkResult==false || $emailDB != $emailForm){
                throw new Exception("Ups, da scheint etwas schief gelaufen zu sein. Check nochmal die von dir eingegebenen Daten!");
            }
            
            //Update Befehle
            $sql2 = "UPDATE kunde SET hasNewPassword=".$hasNewPassword." WHERE email='".$emailDB."'";   
            $stmt2 = $conn->prepare($sql2);
            $stmt2->execute();

            $sql3 = "UPDATE kunde SET password='".$newPassword."' WHERE email='".$emailDB."'";   
            $stmt3 = $conn->prepare($sql3);
            $stmt3->execute();

            
            $mail = new PHPMailer(true);

            try {
                //Server settings
                $mail->isSMTP();                                            //Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                $mail->Username   = 'getraenkeonlineshop@gmail.com';                     //SMTP username
                $mail->Password   = 'iehyzxkbsjshkbgk';                               //SMTP password
                //$mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
                $mail->SMTPSecure = 'ssl';
                //$mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
            
                //Recipients
                $mail->setFrom('getraenkeonlineshop@gmail.com', 'Marios Test');
                $mail->addAddress(''.$emailDB.'', ''.$vorname.'');     //Add a recipient
                
            
                //Content
                $mail->isHTML(true);                                  //Set email format to HTML
                $mail->Subject = 'Passwort erfolgreich zurückgesetzt!';
                $mail->Body    = '
                                <div style="text-align: center; backgound-color: white; color: black; width: 90%; padding-left: 5%; margin: 5px;">
                                  <h2 style="color: white;">softdrinks.com</h2>
                                  <br>
                                  <h3> Hallo, '.$vorname.'</h3> 
                                  <br>
                                  <h5>Du hast dein Passwort erfolgreich zurückgesetzt. <br> Anbei das neue One-Way-Passwort.</h5>
                                  <br>
                                  
                                  
                                  <h3> One-Way-Passwort: '.$newPassword.'</h3>
                                  <br>
                                 
                                  <h3>Bitte klicke auf den folgenden <a style="color: black;" href="localhost/ShopUltimate/Sjop/php/setNewPassword.php" > Link </a> und erstelle <br> dein neues Passwort</h3>
                                  <br>
                                  <h3>Beste Grüße</h3>
                                  <br>
                                  <h3>Ihr softdrinks.com - Team</h3>
                                </div>
                                  ';
            
                $mail->send();

            } catch(Exception $e) {
                echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                echo "<br>";
                echo "Fehler".$e;
                header("Location: forgotPassword.php");
            }
            

            header("Location: checkYourMails.php");
        
        }catch(PDOException $e){
        echo "Fehler: ".$e;
    }

    


?>