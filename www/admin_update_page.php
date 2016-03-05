<?php

	//require the framework
	require_once "requires/initialize.php";
	
	$page = new Page();
	$page->name = "Update a Page";
	$page->is_admin_only = true;
		
	// update the page if the form is submitted
	if(isset($_POST["submit"])) 
	{ 
		$update_page = Page::find_by_id($_POST["page_wk"]);
		$update_page->name = $_POST["page_name"];
		$update_page->body = $_POST["page_content"];

		// if the page successfully updates, go to the page
		if ($update_page->save())
		{
			$session->message("Your page was updated successfully!");
			redirect_head(ROOT_URL . "view_page.php?page_wk=" . $update_page->page_wk);
		}
		else
		{
			$session->message("Unable to update the page at this time.");
		}
	}
	
	// grab the page so it's content can be pre-loaded into the form
	$update_page = Page::find_by_id($_GET["page_wk"]);
	
	require_once "requires/template/header.php";
	
?>

	<!-- Update a page form -->
	<form id="update_page" action="admin_update_page.php?page_wk=<?php echo $update_page->page_wk ?>" method="post">
		Page Name: <input type="text" name="page_name" value="<?php echo $update_page->name ?>"/> <br /> <br />
		Page Content: <textarea rows="5" cols="40" name="page_content"><?php echo $update_page->body ?></textarea> <br /> <br />
		<input type="hidden" value="<?php echo $update_page->page_wk ?>" name="page_wk" />
		<input type="submit" value="Submit" name="submit" />
	</form>

<?php

	require_once "requires/template/footer.php";

?>