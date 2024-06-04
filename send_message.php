<?php
session_start();
require 'dbcon.php';

if (!isset($_GET['patient_id']) || empty($_GET['patient_id'])) {
    echo "Patient ID is required.";
    exit;
}

if (!isset($_GET['doctor_id']) || empty($_GET['doctor_id'])) {
    echo "Doctor ID is required.";
    exit;
}

$patient_id = $_GET['patient_id'];
$doctor_id = $_GET['doctor_id'];

// Fetch patient details
$query = "SELECT * FROM patients WHERE id = ? AND user_id = ?";
$stmt = $con->prepare($query);
$stmt->bind_param("ii", $patient_id, $doctor_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    echo "No patient found with the provided ID.";
    exit;
}

$patient = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['send_message'])) {
    $subject = $_POST['subject'];
    $message = $_POST['message'];
    $to = $patient['email'];
    $headers = "From: newtonnewton0003@gmail.com";
    
    // Send email using mail() function
    if (mail($to, $subject, $message, $headers)) {
        $_SESSION['message'] = "Message sent successfully!";
    } else {
        $_SESSION['message'] = "Message could not be sent.";
    }
    
    header("Location: welcome1.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Message</title>
</head>
<body>
    <h2>Send Message to <?php echo htmlspecialchars($patient['name']); ?></h2>
    <form action="send_message.php?patient_id=<?php echo $patient_id; ?>&doctor_id=<?php echo $doctor_id; ?>" method="post">
        <div>
            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required>
        </div>
        <div>
            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>
        </div>
        <div>
            <button type="submit" name="send_message">Send</button>
        </div>
    </form>
</body>
</html>