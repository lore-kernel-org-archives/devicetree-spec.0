From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Ksummit-discuss] Notes & Slides from Devicetree Workshop at
 Kernel Summit Prague (26 Oct 2017)
Date: Thu, 2 Nov 2017 13:39:05 +0000
Message-ID: <CACxGe6veYSAbBy5PFuU241tut4Jti5TJ-n=Q0kDtvqFxVqSFjQ@mail.gmail.com>
References: <CACxGe6tfRByeJrp43Taj166K4Ni0KjmZkC=Xc1pz2=ga6fvDZQ@mail.gmail.com>
 <f5238061-2f6a-ae47-79b4-912401737c7e@suse.com>
Mime-Version: 1.0
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NY1gQh2OHMnZ7qVs61BWTdkO3j226S1a25sFYWZqgGU=;
        b=j13O3i95mdXrJMudEYDhYdulfYrv762Ggesp68MttRkjv4LFiX0K7CLX2barL3Wjsn
         ZeZBo/fK2C3HRxY01/2QFoEu0ufDNqtBpOJNgmPR1d8nz9+cUGtDXIDOYtj1L27RTjxQ
         CvyZGNgQuSfQCTq6puZ/VqTYZ1H4opwysWtVlpAoRAu3L0W39zDKhI4WWGwBwkShqex3
         W7Htd/dkNcK68m051lKKRnomw38K3fpYlYFkdcq6j6bYAMmC3vcDnzhbMDueT7P4mhNT
         gyyj9naLq1oKw7GJk2pvGm9UFtFAZXijgshTTfNuFVtaWv7PXv8W7Pyu/v53Zp6Nl4SI
         Wj0g==
In-Reply-To: <f5238061-2f6a-ae47-79b4-912401737c7e-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hudson <darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org>, Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

On Thu, Nov 2, 2017 at 12:21 PM, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org> wrote:
>
>
> On 10/30/2017 05:01 PM, Grant Likely wrote:
>> Thank you to everyone who attended the Devicetree Workshop as part of
>> the 2017 Kernel Summit in Prague last week. I heard lots of good
>> feedback, and I'm already thinking about how to organize next year's
>> gathering.
>>
>> Slides and notes have been uploaded to elinux.org. A summary of the
>> topics and next steps still needs to be written. You can find the
>> notes and slides here:
>>
>> https://elinux.org/Device_tree_future#Kernel_Summit_2017.2C_Devicetree_Workshop
>>
>> I also have an audio recording of the entire day, but they are large
>> audio files (100-200MB each) and I haven't decided how to publish them
>> yet.
>>
>> Particular thanks to everyone who helped take notes (Sadly, I didn't
>> grab the list of names before they disappeared from Etherpad, so the
>> only person I can thank by name is Julia Lawall who emailed me notes
>> separately). Also thanks to Sean Hudson for taking care of sound and
>> to Frank Roland for running microphones around the room. Finally, a
>> big thank you to the Linux Foundation staff who sorted out all of the
>> hotel logistics for us.
>>
>> Please look at the notes to check for accuracy, and I would appreciate
>> any volunteers to help write up the summary for the day.
>>
>> I'll post the group photo as soon as I receive it.
>>
>
> You can find the photo here:
>
> https://www.flickr.com/photos/linuxfoundation/38019230622/in/album-72157661789269468/

Thanks Matthias. There is also a copy of it on the elinux page linked above.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
