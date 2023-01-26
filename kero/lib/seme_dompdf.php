<?php
require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;

class Seme_Dompdf {
    public function download($r=[]){
        $data = [];
        if(!isset($r['html'])){
            $data['status'] = 400;
            $data['message'] = 'HTML not found';
            return $data;
        }
        $dompdf = new Dompdf();
        $dompdf->loadHtml($r['html']);

		// (Optional) Setup the paper size and orientation 
		$dompdf->setPaper($r['ukuran'], $r['rotasi']);

		// Render the HTML as PDF 
		$dompdf->render();

		// Output the generated PDF to Browser 
		$dompdf->stream($r['filename'], ['Attachment' => false]);
    }
}