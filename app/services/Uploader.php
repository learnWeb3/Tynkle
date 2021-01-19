<?php

class Uploader
{

    public static function uploadFileBatch(array $file_input_names)
    {
        $uploaded_file_paths = [];
        foreach ($file_input_names as $i => $v) {
            try {
                $uploaded_file_paths[] = Uploader::uploadFile($v);
            } catch (\Throwable $th) {
                //throw $th;
            }
        }
        return $uploaded_file_paths;
    }
    public static function uploadFile(string $file_input_name)
    {
        $file_size_limit = 10000000;
        $authorized_file_types = ["image/jpeg", "image/jpg", "image/png", "image/svg"];
        $file = $_FILES[$file_input_name];
        if (!empty($file)) {
            $file_name = $file["name"];
            $file_type = $file["type"];
            $file_tmp_name = $file["tmp_name"];
            $error = $file["error"];
            $file_size = $file['size'];
            $time = time();
            if ($error !== 0) {
                throw new Exception("upload failed");
            }
            if ($file_size > $file_size_limit) {
                throw new Exception("file size exceeds authorized limit");
            }
            if (!in_array($file_type, $authorized_file_types)) {
                throw new Exception("file type is incorrect");
            }
            if (move_uploaded_file($file_tmp_name, UPLOAD_PATH . "/" . $time . '-' . $file_name)) {
                return ABSOLUTE_UPLOAD_PATH.'/'.$time . '-' . $file_name;
            } else {
                throw new Exception("upload failed");
            }
        }
    }
}
