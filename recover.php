<?php
function safe_mkdir_p($path)
{
	if (!is_dir($path)) {
	    if (mkdir($path, 0777, true)) {
		//echo "Directory created successfully: $path";
	    } else {
		//echo "Failed to create directory: $path";
	    }
	} else {
	    //echo "Directory already exists: $path";
	}
}
function run_cmd($cmd)
{
	// Run a simple command
	$output = [];
	$return_var = 0;

	exec($cmd, $output, $return_var);

	//echo "Return code: $return_var" . PHP_EOL;
	//echo "Output:" . PHP_EOL;
	print_r($output);
}


$filename = "list.txt";




// Open the file for reading
$handle = fopen($filename, "r");
if ($handle) {
    while (($line = fgets($handle)) !== false) {
        $line = trim($line); // Remove extra whitespace/newlines
        echo $line . PHP_EOL;

        // Split into two variables (hash and filename)
        $parts = explode(" ", $line, 3); // Limit to 2 parts
        $hash = $parts[0] ?? '';
        $file = $parts[2] ?? '';

       //echo "Hash: $hash" . PHP_EOL;
        echo "Filename:$file" . PHP_EOL;
        $dirx = "../recoverd".dirname($file);
        $filex="../recoverd$file";
        safe_mkdir_p($dirx);
        run_cmd("acrypter decrypt cry15360 \"encrypted$file/file.acrypt\" \"$filex\"");
        
    }
    fclose($handle);
} else {
   // echo "Error opening the file.";
}
?>

