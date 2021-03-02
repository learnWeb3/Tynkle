<?php

use \Mailjet\Resources;


class Mailer
{
    protected $sender_entity;
    protected $recipient_entity;
    protected $sender_email;
    protected $recipient_email;
    protected $message_subject;
    protected $message_content;
    protected $message_template_path;

    public function __construct(string $sender_entity, string $recipient_entity, string $sender_email, string $recipient_email, string $message_subject, string $message_content, string $message_template_path)
    {

        $this->sender_entity = $sender_entity;
        $this->recipient_entity = $recipient_entity;
        $this->sender_email = $sender_email;
        $this->recipient_email = $recipient_email;
        $this->message_subject = $message_subject;
        $this->message_content = $message_content;
        // for html template
        $this->message_template_path = $message_template_path;
    }


    public function send($vars=[])
    {
        extract($vars);
        ob_start();
        require_once $this->message_template_path;
        $html = ob_get_clean();
       
        $mj = new \Mailjet\Client(
            $_ENV['MAILJET_PUBLIC_KEY'],
            $_ENV['MAILJET_SECRET_KEY'],
            true,
            ['version' => 'v3.1']
        );

        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => $this->sender_email,
                        'Name' => $this->sender_entity
                    ],
                    'To' => [
                        [
                            'Email' => $this->recipient_email,
                            'Name' => $this->recipient_entity
                        ]
                    ],
                    'Subject' => $this->message_subject,
                    'TextPart' => $this->message_content,
                    'HTMLPart' => $html
                ]
            ]
        ];

        $response = $mj->post(Resources::$Email, ['body' => $body]);
        echo json_encode($response->getData());
        die();
    }
    
}