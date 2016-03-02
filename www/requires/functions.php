<?php

	/*
		This page will define basic functions as a library.
		It's just to our advantage - also good practice.
	*/
	
	//The current URL
	function current_url() {
		return (!empty($_SERVER['HTTPS'])) ? "https://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'] : "http://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];

	}
	
	//The current page with $_GET extensions
	function file_name_with_get() {
		return pathinfo(current_url() , PATHINFO_BASENAME);

	}
	
	//The current page without $_GET extensions
	function file_name_without_get() {
		$file_path = $_SERVER["SCRIPT_NAME"];
		$break = explode('/', $file_path);
		$page_file_name_without_get = $break[count($break) - 1];
		return $page_file_name_without_get;
	}
	
	//Gets user's IP address
	function users_current_ip() { 
		if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
			return trim($_SERVER['HTTP_X_FORWARDED_FOR']);
		else 
			return trim($_SERVER['REMOTE_ADDR']);
	}
	
	//Get current timestamp
	function current_timestamp() {
		return date("Y-m-d H:i:s");	
	}
	
	//This function redirects you to a certain page - HEAD
	//NOTE: MUST BE INVOKED BEFORE ANY HTML IS SPIT ONTO SCREEN!!!
	function redirect_head( $location = NULL ) {
		if ($location != NULL) {
			header("location: {$location}");
		}
	}
	
	//This function redirects you to a certain page - META
	function redirect_meta( $location = NULL , $seconds_to_wait = 0) {
		if ($location != NULL) {
			echo "<meta http-equiv=\"refresh\" content=\"{$seconds_to_wait};URL={$location}\">";
		}
	}
	
	//This functions creates random keys
	function random_key($length) {
    	srand(date("s"));
		$possible_characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    	$string = "";
    	while(strlen($string)<$length) {
			$string .= substr($possible_characters, rand()%(strlen($possible_characters)),1);
   		}
    	return($string);
	}
	
	//if single line, replace continuous multiple space with 1 space
	function space_clean($string) {
		return preg_replace('!\s+!', ' ', $string);
	}
	
	//display error
	function display_error() {
		global $session;
		if ($session->message() != '') 
			echo "<p style=\"color:red;\">".$session->message()."</p>";
	}

	// A function to ensure that only authorized users (admin, staff, user) can view respective pages.
	function page_security() 
	{
		global $page;
		global $user;
		global $session;
		
		if (($page->is_user_only || $page->is_admin_only) && !$session->is_logged_in) 
		{
			$session->message("You must be logged in to view that page.");
			redirect_head(ROOT_URL);
		}
		if($page->is_admin_only && ($user->role_wk != "2" && $user->role_wk != "3"))
		{
			$session->message("You must be an administrator to view that page.");
			redirect_head(ROOT_URL);
		}
	}
?>