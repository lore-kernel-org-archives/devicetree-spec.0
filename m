From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH DT spec 3/3] Document additional "phy-connection-type" values
Date: Fri, 6 May 2016 11:13:02 +0100
Message-ID: <CACxGe6vwBqE7uDFcV8a=XsuZngzTEfPWsazRF=8C00BEYwwHfA@mail.gmail.com>
References: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com> <1462511327-21077-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aZn0AyGzzjoSzPSDD2c0/byt2nFYm7OjLOQ39UCkIeo=;
        b=LhAPD8XWcSilWeirxiwfT/HemUr3gVnw3OTPUMcH6bgRQ9bPJ6bNFMMZ4B8RtxK6tm
         DejJ6/6KlRxgu7ZRX8tQ3hnPEWCw33o9pSVWXKqc7aG/MgqJU2irY6C84q3+P3CcXvrY
         vdPY18WDuNfsPbyMB35xZIP980lsa+WZa2rIFqOt7fWnmZ4KKzowlTPWWf2oHzZn/QZ3
         NuS+aPQB6WR8S2X6RRhMpIAF7rU+SvCL6GGZVDgU0EVXYH3sikfTiQnyXTsveCBi7Bg0
         N6+FdQ/WCuOsEP5QoiigD/2ioLMMJN9ax61BwMG1+gpZtAtbnmWsp72403tTpd0ysqyE
         zVwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=aZn0AyGzzjoSzPSDD2c0/byt2nFYm7OjLOQ39UCkIeo=;
        b=fK1Ocy7psgR9R3I5gCsnbAUHXPP/iHhfAoBZv+ZN8Lcbd1kOjLrGh8JbR3X8ihyhRI
         uFveY8DfxeRvTn5XLK2uWAV4pwNgoF0UeCfphWZhAMca1HOJbJw4feZ5LuvAQv1Ceqcl
         5si5kRayFSG5s+oqF3D3IVMRbdCe3uZ7Na9Xk=
In-Reply-To: <1462511327-21077-4-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, May 6, 2016 at 6:08 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add the following values to the "phy-connection-type" property:
>
> * Serial Gigabit Media Independent Interface      ``sgmii``
> * Reverse Media Independent Interface             ``rev-mii``
> * 10 Gigabits Media Independent Interface         ``xgmii``
> * Multimedia over Coaxial                         ``moca``
> * Quad Serial Gigabit Media Independent Interface ``qsgmii``
>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Merged, thanks. Made one minor correction below...

> ---
>  source/device-bindings.rst | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/source/device-bindings.rst b/source/device-bindings.rst
> index 6bf79ff..bf197ee 100644
> --- a/source/device-bindings.rst
> +++ b/source/device-bindings.rst
> @@ -332,20 +332,25 @@ the network device class.
>  .. tabularcolumns:: | l J |
>  .. table:: Defined values for the ``phy-connection-type`` Property
>
> -   ===================================== ============
> +   =============================================== ============
>     Connection type                       Value
> -   ===================================== ============

The "Value" heading needed to be indented further also to get the
table to render correctly.

g.

> -   Media Independent Interface           ``mii``
> -   Reduced Media Independent Interface   ``rmii``
> -   Gigabit Media Independent Interface   ``gmii``
> -   Reduced Gigabit Media Independent     ``rgmii``
> -   rgmii with internal delay             ``rgmii-id``
> -   rgmii with internal delay on TX only  ``rgmii-txid``
> -   rgmii with internal delay on RX only  ``rgmii-rxid``
> -   Ten Bit Interface                     ``tbi``
> -   Reduced Ten Bit Interface             ``rtbi``
> -   Serial Media Independent Interface    ``smii``
> -   ===================================== ============
> +   =============================================== ============
> +   Media Independent Interface                     ``mii``
> +   Reduced Media Independent Interface             ``rmii``
> +   Gigabit Media Independent Interface             ``gmii``
> +   Reduced Gigabit Media Independent               ``rgmii``
> +   rgmii with internal delay                       ``rgmii-id``
> +   rgmii with internal delay on TX only            ``rgmii-txid``
> +   rgmii with internal delay on RX only            ``rgmii-rxid``
> +   Ten Bit Interface                               ``tbi``
> +   Reduced Ten Bit Interface                       ``rtbi``
> +   Serial Media Independent Interface              ``smii``
> +   Serial Gigabit Media Independent Interface      ``sgmii``
> +   Reverse Media Independent Interface             ``rev-mii``
> +   10 Gigabits Media Independent Interface         ``xgmii``
> +   Multimedia over Coaxial                         ``moca``
> +   Quad Serial Gigabit Media Independent Interface ``qsgmii``
> +   =============================================== ============
>
>  ``phy-handle`` Property
>  ^^^^^^^^^^^^^^^^^^^^^^^
> --
> 2.7.4
>
