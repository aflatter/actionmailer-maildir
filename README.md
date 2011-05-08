actionmailer-maildir
====================

An additional delivery method for ActionMailer using the maildir gem. This gem does not do much and there is not much to describe.

How to
------

    ActionMailer::Base.delivery_method = :maildir.
    ActionMailer::Base.maildir_settings = {:path => '/my/mail/dir'}
