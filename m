From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] doc: dt: mtd: support partitions in a special
 'partitions' subnode
Date: Fri, 30 Oct 2015 17:23:26 -0700
Message-ID: <20151031002326.GM13239@google.com>
References: <1446072486-145169-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=etjMe7D9ufFcsXBhFpMWRw5kQ/RZDTWN2anYIC+z1ts=;
        b=vCUqtp7mkuJZAZgcwW6+f88eaINdXxoHOr+YMA4/0dfslH7WFB1a3I+Fbm+3zhNPD2
         s7954BOBRyqqEmqIaNhvQg+bUyt2KasyIkVSZhu3udX7PD35DBVKJpDHRJQRqGh1uUp6
         c6E1Mg3qMR5agXAPdqngaCmWSXoAqWaP3tI3Udlo0G4TDs27BGVSxfSiMb8zdRXAcRWt
         /rgD7psP7MSm8sqm9ZL6F8xiS7qx0X/T5MDEb97MimIni8SE2ZzM3EPpfCzY4tlL8AII
         LZJ1v4P5WhXGv1i7MVoO3qFvUdSP6zAhJM+60N9WrovoW6b/dpEPtYsOiKFa+5arUM4U
         S35A==
Content-Disposition: inline
In-Reply-To: <1446072486-145169-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Oct 28, 2015 at 03:48:06PM -0700, Brian Norris wrote:
> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> To avoid conflict with other drivers using subnodes of the mtd device
> create only one ofpart-specific node rather than any number of
> arbitrary partition subnodes.
> 
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to l2-mtd.git
