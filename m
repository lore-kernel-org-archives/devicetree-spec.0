From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [DTSpec PATCH] Document additional "phy-connection-type" values
Date: Fri, 23 Sep 2016 11:34:28 +0100
Message-ID: <CACxGe6un_6pNMOGVtTraY69QbiBXNXBH2ojk57p-Tc8fcRZ9UQ@mail.gmail.com>
References: <1474613260-15457-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/ywdjjXAyvL5rpnEUpgLlUqg5dK4/ZH9o0FHj4uql9g=;
        b=NDfBtUKIKKH8Xe0DbxXHYZdYKjcRO/9w5Aj45G5t4AULL+YqLa1UoajL+uBKsStN+r
         ZXRu6+zXurnHOXQImsDvAogXDloVaSzIrAtmutmsKlDH7ccXIdenw9IiW51wMFHTMrOf
         Bc1psW1+GEsIfjWPALh8BXePWPts+FUypr0TbTUG8+XBNAtnMtNnX7RhssjGXxjAqPK5
         VaS5W4IDC2XeCaGcp5wHmQdNTNNihJuJhK4L5MSKpq4fSg9taLofECnWehzBxHlflUNt
         rvapbR5B8xxN/0gQP5p6dm6yIyVkrno7zKfebC3ISFwCy9B6vkX7TJvWezytAlf8X6TC
         2mew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/ywdjjXAyvL5rpnEUpgLlUqg5dK4/ZH9o0FHj4uql9g=;
        b=D5LiQbhkM0ePdGiFhf8DlBpmFN7dJ8qAT+ZNQFBPSjAmEmH8Q6Y4ehRnKntxWasQtM
         vQvLHaCN5noW8h5XLBjZYm2nNhD8l/T23/NAcCZYjrPIWV5lHRZp6I0ab8sSKEc5PX4y
         9dJV4CIjyduTfcH94ap6Sc/qUGY3Ce03iQFJ0=
In-Reply-To: <1474613260-15457-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

On Fri, Sep 23, 2016 at 7:47 AM,  <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add the following values to the "phy-connection-type" property:
>
> * Turbo Reduced Gigabit Media Independent Interface ``trgmii``
>
> Suggested-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Applied, thanks.

g.

> ---
>  source/device-bindings.rst |   39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/source/device-bindings.rst b/source/device-bindings.rst
> index 7020267..9de6f3c 100644
> --- a/source/device-bindings.rst
> +++ b/source/device-bindings.rst
> @@ -332,25 +332,26 @@ the network device class.
>  .. tabularcolumns:: | l J |
>  .. table:: Defined values for the ``phy-connection-type`` Property
>
> -   =============================================== ============
> -   Connection type                                 Value
> -   =============================================== ============
> -   Media Independent Interface                     ``mii``
> -   Reduced Media Independent Interface             ``rmii``
> -   Gigabit Media Independent Interface             ``gmii``
> -   Reduced Gigabit Media Independent               ``rgmii``
> -   rgmii with internal delay                       ``rgmii-id``
> -   rgmii with internal delay on TX only            ``rgmii-txid``
> -   rgmii with internal delay on RX only            ``rgmii-rxid``
> -   Ten Bit Interface                               ``tbi``
> -   Reduced Ten Bit Interface                       ``rtbi``
> -   Serial Media Independent Interface              ``smii``
> -   Serial Gigabit Media Independent Interface      ``sgmii``
> -   Reverse Media Independent Interface             ``rev-mii``
> -   10 Gigabits Media Independent Interface         ``xgmii``
> -   Multimedia over Coaxial                         ``moca``
> -   Quad Serial Gigabit Media Independent Interface ``qsgmii``
> -   =============================================== ============
> +   ================================================= ============
> +   Connection type                                   Value
> +   ================================================= ============
> +   Media Independent Interface                       ``mii``
> +   Reduced Media Independent Interface               ``rmii``
> +   Gigabit Media Independent Interface               ``gmii``
> +   Reduced Gigabit Media Independent                 ``rgmii``
> +   rgmii with internal delay                         ``rgmii-id``
> +   rgmii with internal delay on TX only              ``rgmii-txid``
> +   rgmii with internal delay on RX only              ``rgmii-rxid``
> +   Ten Bit Interface                                 ``tbi``
> +   Reduced Ten Bit Interface                         ``rtbi``
> +   Serial Media Independent Interface                ``smii``
> +   Serial Gigabit Media Independent Interface        ``sgmii``
> +   Reverse Media Independent Interface               ``rev-mii``
> +   10 Gigabits Media Independent Interface           ``xgmii``
> +   Multimedia over Coaxial                           ``moca``
> +   Quad Serial Gigabit Media Independent Interface   ``qsgmii``
> +   Turbo Reduced Gigabit Media Independent Interface ``trgmii``
> +   ================================================= ============
>
>  ``phy-handle`` Property
>  ^^^^^^^^^^^^^^^^^^^^^^^
> --
> 1.7.9.5
>
